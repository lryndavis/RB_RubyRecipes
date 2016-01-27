require("bundler/setup")
require('pry')
Bundler.require(:default)

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }

get('/') do
  @recipes = Recipe.all
  erb(:index)
end

post('/recipes') do
  recipe_name = params.fetch('recipe_name')
  Recipe.create({recipe_name: recipe_name})
  redirect ('/')
end

get('/recipes/:id') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  erb(:recipe)
end

patch('/recipes/:id') do
  instructions = params.fetch('instructions')
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.update({:instructions => instructions})
  erb(:recipe)
end

delete('/recipes/:id/delete') do
  @recipe = Recipe.find(params.fetch("id").to_i)
  @recipe.delete
  redirect ('/')
end
