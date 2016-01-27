require('spec_helper')

describe('ability to add a new recipe to the application', {:type => :feature}) do
  it('allows a user to add a new recipe to the list of recipes') do
    visit('/')
    fill_in('recipe_name', :with => "Potato Soup")
    click_button('Add')
    expect(page).to have_content('Potato Soup')
  end
end
