class Recipe < ActiveRecord::Base
  has_and_belongs_to_many(:tags)
  has_and_belongs_to_many(:ingredients)
  validates(:recipe_name, :presence => true)
    before_save(:titleize_recipe_name)

  private

  define_method(:titleize_recipe_name) do
    self.recipe_name=(recipe_name().titleize())
  end
end
