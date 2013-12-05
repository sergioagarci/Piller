require 'spec_helper'
	describe "Static pages" do
		describe "Home page" do
			it "should have the h1 'Piller'" do
				visit 'root_path'
				page.should have_selector('h1', :text => 'Piller')
			end
			it "should have the title 'Home'" do
				visit 'root_path'
				page.should have_selector('title',:text => "Proyecto SYTW Piller | Home")
			end
		end
		describe "Help page" do
			it "should have the h1 'Help'" do
				visit 'help_path'
				page.should have_selector('h1', :text => 'Help')
			end
			it "should have the title 'Help'" do
				visit 'help_path'
				page.should have_selector('title',:text => "Proyecto SYTW Piller | Help")
			end
		end
		describe "About page" do
			it "should have the h1 'About Us'" do
				visit 'about_path'
				page.should have_selector('h1', :text => 'About Us')
			end
			it "should have the title 'About Us'" do
				visit 'about_path'
				page.should have_selector('title',:text => "Proyecto SYTW Piller | About Us")
			end
		end
end
