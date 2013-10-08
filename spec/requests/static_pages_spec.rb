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

		describe "for signed-in users" do
			let(:user) { FactoryGirl.create(:user) }
			before do
				FactoryGirl.create(:micropost, user: user, content: "Lorem ipsum")
				FactoryGirl.create(:micropost, user: user, content: "Dolor sit amet")
				sign_in user
				visit root_path
			end

			it "should render the user's feed" do
				user.feed.each do |item|
					expect(page).to have_selector("li##{item.id}", text: item.content)
				end
			end	

			describe "follower/following counts" do
				let(:other_user) { FactoryGirl.create(:user) }
				before do
					other_user.follow!(user)
					visit root_path
				end

				it { should have_link("0 following", href: following_user_path(user)) }
				it { should have_link("1 followers", href: followers_user_path(user)) }
			end	
		end
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
