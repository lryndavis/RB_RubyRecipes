class Ingredient < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  before_save(:titleize_ingredient_name)

  private

  define_method(:titleize_ingredient_name) do
    self.ingredient_name=(ingredient_name().titleize())
  end
end
