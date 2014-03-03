require 'spec_helper'

feature "Director adds a new category" do
  given(:director) { FactoryGirl.create(:director) }
  background do 
    sign_in director
    visit new_admin_category_path
  end

  scenario "with valid information" do
    fill_in "Name",        with: "Name"
    fill_in "Description", with: "MyDescription"
    click_button "Create Category"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Category | Name"
    expect(page).to have_text "MyDescription"
  end

  scenario "with invalid information" do
    click_button "Create Category"
    expect(page).to have_danger_message
    expect(page).to have_title "Eat Halal | Category | New"
  end
end

feature "Director edits a category" do
  given(:category) { FactoryGirl.create(:category) }
  given(:director) { FactoryGirl.create(:director) }

  background do
    sign_in director
    visit edit_admin_category_path(category)
  end

  scenario "with valid information" do
    fill_in "Name", with: "NewName"
    fill_in "Description", with: "NewDescription"
    click_button "Update Category"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Category | NewName"
    expect(page).to have_text "NewDescription"
  end

  scenario "with invalid information" do
    fill_in "Description", with: "  "
    click_button "Update Category"
    expect(page).to have_danger_message
    expect(page).to have_title "Eat Halal | Category | Edit #{category.name}"
  end
end

feature "Director views category index" do
  given(:category) { FactoryGirl.create(:category) }
  given(:director) { FactoryGirl.create(:director) }

  background { sign_in director }

  scenario "with no categories" do
    visit admin_categories_path
    expect(page).to have_title "Eat Halal | Categories"
    expect(page).to have_text "No categories have been added."
  end

  scenario "with one category" do
    category
    visit admin_categories_path
    expect(page).to have_title "Eat Halal | Categories"
    expect(page).to have_text category.id
    expect(page).to have_text category.name
    expect(page).to have_text category.description
  end
end

feature "Director deletes a category" do
  given(:category) { FactoryGirl.create(:category) }
  given(:director) { FactoryGirl.create(:director) }

  background do
    sign_in director
    visit admin_category_path(category)
  end

  scenario "successfully" do
    click_link "Destroy"
    expect(page).to have_notice_message
    expect(page).to have_title "Eat Halal | Categories"
    expect(page).to_not have_link category.id, href: edit_admin_category_path(category)
    expect(page).to_not have_text category.name
    expect(page).to_not have_text category.description
  end
end