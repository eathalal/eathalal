require 'spec_helper'

describe "Static pages" do

  describe "Welcome page" do

		it "should have the content 'Eat Halal" do
		  visit root_path
		  expect(page).to have_content('Eat Halal')
		end

		it "should have the right title" do
			visit root_path
			expect(page).to have_title("Ahlan wa Sahlan | Eat Halal Ltd")
		end

  end

end