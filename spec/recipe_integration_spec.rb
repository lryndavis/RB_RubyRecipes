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

  describe('ability to delete recipes', {:type => :feature}) do
    it('allows the user to delete individual recipes') do
      visit('/')
      fill_in('recipe_name', :with => "Tomato Soup")
      click_button('Add Recipe')
      expect(page).to have_content('Tomato Soup')
      click_link('Tomato Soup')
      click_button('Delete this Recipe')
      expect(page).not_to(have_content('Tomato Soup'))
    end
  end

  describe('ability to update tags', {:type => :feature}) do
    it('allows the user to update tag names') do
      visit('/')
      fill_in('category', :with => "Vegan")
      click_button('Add Tag')
      expect(page).to have_content('Vegan')
      click_link('Vegan')
      fill_in('category', :with => "Vegan Friendly")
      click_button('Update Tag')
      expect(page).to have_content('Vegan Friendly')
    end
  end

  describe('ability to delete tags', {:type => :feature}) do
    it('allows the user to delete individual tags') do
      visit('/')
      fill_in('category', :with => "Vegan")
      click_button('Add Tag')
      expect(page).to have_content('Vegan')
      click_link('Vegan')
      click_button('Delete this Tag')
      expect(page).not_to(have_content('Vegan'))
    end
  end

  describe('ability to search recipes by tag', {:type => :feature}) do
    it('allows the user to search for recipes based on their corresponding tags') do
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
      click_link('HOME')
      expect(page).to have_content('Search by Tags:')
      click_link('Vegan')
      expect(page).to have_content('Tomato Soup')
    end
  end
