class Product < ApplicationRecord
  belongs_to :shop
  def to_param
    name
  end
end
