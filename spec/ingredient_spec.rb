require('spec_helper')

describe(Ingredient) do
it("converts the ingredient entry to titlecase") do
  ingredient = Ingredient.create({:ingredient_name => "pepper"})
  expect(ingredient.ingredient_name()).to(eq("Pepper"))
  end
end
