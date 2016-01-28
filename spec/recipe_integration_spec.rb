require('spec_helper')

describe('ability to add a new recipe to the application', {:type => :feature}) do
    it('allows a user to add a new recipe to the list of recipes') do
      visit('/')
      fill_in('recipe_name', :with => "Potato Soup")
      click_button('Add Recipe')
      expect(page).to have_content('Potato Soup')
    end
  end

  describe('ability to add tags to the application', {:type => :feature}) do
      it('allows a user to add a new tag') do
        visit('/')
        fill_in('category', :with => "Breakfast")
        click_button('Add Tag')
        expect(page).to have_content('Breakfast')
      end
    end

  describe('ability to add instructions to each recipe', {:type => :feature}) do
    it('allows th user to add insutructions') do
      visit('/')
      fill_in('recipe_name', :with => "Tomato Soup")
      click_button('Add Recipe')
      expect(page).to have_content('Tomato Soup')
      click_link('Tomato Soup', :match => :first)
      expect(page).to have_content('Add Instructions Below:')
      fill_in('instructions', :with => "Make the Soup")
      click_button("Submit", :match => :first)
      expect(page).to have_content('Make the Soup')
    end
  end

  describe('ability to add tags to each recipe', {:type => :feature}) do
    it('allows the user to add tags to each recipe') do
      visit('/')
      fill_in('category', :with => "Vegan")
      click_button('Add Tag')
      expect(page).to have_content('Vegan')
      visit('/')
      fill_in('recipe_name', :with => "Tomato Soup")
      click_button('Add Recipe')
      expect(page).to have_content('Tomato Soup')
      click_link('Tomato Soup', :match => :first)
      expect(page).to have_content('Add Tags:')
      select "Vegan", :from => "tag_id"
      click_button('Add Tag')
      expect(page).to have_content('Vegan')
    end
  end

  describe('ability to add ingredients to each recipe', {:type => :feature}) do
    it('allows the user to add ingredients to each recipe') do
      visit('/')
      fill_in('recipe_name', :with => "Tomato Soup")
      click_button('Add Recipe')
      expect(page).to have_content('Tomato Soup')
      click_link('Tomato Soup', :match => :first)
      expect(page).to have_content('Add an Ingredient:')
      fill_in('ingredient_name', :with => "Pepper")
      click_button('Add')
      expect(page).to have_content('Pepper')
    end
  end

  
