require('spec_helper')

describe(Recipe) do
it("converts the recipe name to titlecase") do
  recipe = Recipe.create({:recipe_name => "potato soup"})
  expect(recipe.recipe_name()).to(eq("Potato Soup"))
  end

  it("validates presence of a recipe name entry") do
    recipe = Recipe.new({:recipe_name => ""})
    expect(recipe.save()).to(eq(false))
  end
end
