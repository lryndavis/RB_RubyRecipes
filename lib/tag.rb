class Tag < ActiveRecord::Base
  has_and_belongs_to_many(:recipes)
  validates(:category, :presence => true)
  before_save(:titleize_category)

  private

  define_method(:titleize_category) do
    self.category=(category().titleize())
  end
end
