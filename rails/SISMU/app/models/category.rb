class Category < ApplicationRecord
    has_and_belongs_to_many :productos, dependent: :destroy
end


