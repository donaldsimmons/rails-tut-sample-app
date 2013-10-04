require 'spec_helper'

describe "Static pages" do
	subject { page }

	shared_examples_for "all static pages" do 
		it { should have_title(full_title(page_title)) }
	end

	describe "Home page" do
		before { visit root_path }
		let(:page_title) { "" }

		it { should have_content("Sample App") }
		it { should_not have_title("| Home") }	
	end

	describe "Help page" do
		before { visit help_path }
		let(:page_title) { "" }

		it { should have_content("Help") }
		it { should_not have_title("| Help")} 
	end

	describe "About page" do
		before { visit about_path }
		let(:page_title) { "About Us" }

		it {should have_content("About")}
	end

	describe "Contact Page" do
		before { visit contact_path }
		let(:page_title) { "Contact" }

		it { should have_content("Contact") } 
	end

	it "should have the right links on the layout" do
		visit root_path
		click_link "About"
		expect(page).to have_title(full_title("About Us"))
		click_link "Help"
		expect(page).to have_title(full_title(""))
		click_link "Contact"
		expect(page).to have_title(full_title("Contact"))
		click_link "sample app"
		expect(page).to have_title(full_title(""))
	end
end
