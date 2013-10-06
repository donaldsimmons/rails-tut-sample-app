FactoryGirl.define do
	factory :user do
		name 			"Trey Simmons"
		email			"trey@example.com"
		password	"secretpassword"
	  password_confirmation "secretpassword"	
	end
end
