class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    #@products = Product.all
    @shop = Shop.where(:name => params[:shop_id]).first
    @products = @shop.products.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    #@product = Product.new
    @shop = Shop.where(:name => params[:shop_id]).first
    @product = @shop.products.build
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    #@product = Product.new(product_params)
    @shop = Shop.where(:name => params[:shop_id]).first
    @product = @shop.products.build(product_params)

    respond_to do |format|
      if @product.save
        #format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.html { redirect_to [@shop, @product], notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        #format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.html { redirect_to [@shop, @product], notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      #format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.html { redirect_to shop_products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      #@product = Product.find(params[:id])
      @shop = Shop.where(:name => params[:shop_id]).first
      @product = @shop.products.where(:id => params[:id]).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:shop_id, :title, :description, :price, :image)
    end
end
