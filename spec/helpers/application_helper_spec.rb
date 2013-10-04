require "spec_helper"

describe ApplicationHelper do
	describe "full_title" do
		it "should include the page title" do
			expect(full_title("foo")).to match(/foo/)
		end
		
		it "should include base title" do 
			expect(full_title("")).to match(/Ruby on Rails Tutorial Sample App/)
		end

		it "should not show bar if there is no page title" do
			expect(full_title("")).not_to match(/\|/)
		end
	end
end
