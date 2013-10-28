FactoryGirl.define do
	factory :user do
		name			"Example User"
		email			"example@gmail.com"
		password	"example123"
		password_confirmation "example123"
	end
end