require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all
  @tags = Tag.all
  erb(:index)
end

post('/recipes') do
  recipe_name = params.fetch('recipe_name')
  Recipe.create({recipe_name: recipe_name})
  redirect ('/')
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @tags = Tag.all
  erb(:recipe)
end

patch('/recipes/:id') do
  instructions = params.fetch('instructions')
  @tags = Tag.all
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.update({:instructions => instructions})
  erb(:recipe)
end

patch('/recipes/:id/tags') do
  @tags = Tag.all
  @tag = Tag.find(params.fetch("tag_id").to_i)
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.tags.push(@tag)
  erb(:recipe)
end

delete('/recipes/:id/delete') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.delete
  redirect ('/')
end

post('/tags') do
  category = params.fetch('category')
  Tag.create({category: category})
  redirect ('/')
end

get('/tags/:id') do
  @tag = Tag.find(params.fetch("id").to_i)
  # @recipe = Recipe.find(params.fetch("id").to_i)
  erb(:tag)
end

delete('/tags/:id/delete') do
  @tag = Tag.find(params.fetch("id").to_i)
  @tag.delete
  redirect ('/')
end
