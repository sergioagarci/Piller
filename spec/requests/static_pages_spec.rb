=begin
require 'spec_helper'
	describe "Static pages" do
		describe "Home page" do
			before { visit home_path }

    		it { should have_selector('h1',    text: 'Piller') }
    		it { should have_selector('title', text: full_title('')) }
    		it { should_not have_selector 'title', text: 'Proyecto SYTW Piller | Home' }
			
		end
		describe "Help page" do
    		before { visit help_path }

    		it { should have_selector('h1',    text: 'Pagina de ayuda') }
    		it { should have_selector('title', text: full_title('Help')) }
  		end

  		describe "About page" do
   		 	before { visit about_path }

    		it { should have_selector('h1',    text: 'Quienes Somos') }
    		it { should have_selector('title', text: full_title('Quienes Somos')) }
  		end

  		describe "Contact page" do
    		before { visit contact_path }

    		it { should have_selector('h1',    text: 'Contacta') }
    		it { should have_selector('title', text: full_title('Contacta')) }
  end
end
=end
require 'spec_helper'

describe "Static pages" do

  subject { page }

  describe "Home page" do
    before { visit root_path }

    it { should have_content('Home') }
    it { should have_title(full_title('Home')) }
    it { should_not have_title('Proyecto Piller Home') }
  end

  describe "Help page" do
    before { visit help_path }

    it { should have_content('Help') }
    it { should have_title(full_title('Help')) }
  end

  describe "About page" do
    before { visit about_path }

    it { should have_content('Quienes Somos') }
    it { should have_title(full_title('Quienes Somos')) }
  end

  describe "Contact page" do
    before { visit contact_path }

    it { should have_content('Contact') }
    it { should have_title(full_title('Contact')) }
  end
end