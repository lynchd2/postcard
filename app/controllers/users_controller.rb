class UsersController < ApplicationController
  def index
  	@faker_paragraph = Faker::Lorem.paragraph(12)
  	@faker_bullet_point1 = Faker::Lorem.sentence(7)
  	@faker_bullet_point2 = Faker::Lorem.sentence(8)
  	@faker_bullet_point3 = Faker::Lorem.sentence(7)
  	@faker_bullet_point4 = Faker::Lorem.sentence(9)
  	@faker_bullet_point5 = Faker::Lorem.sentence(6)
  	@faker_bullet_point6 = Faker::Lorem.sentence(7)
  	@faker_paragraph2 = Faker::Lorem.paragraph(5)
  	@user = User.new()
  end

  def show
  end

  def create
  	@user = User.create(create_user_params)
  	if @user.save
  		UserMailer.confirmation(@user).deliver_now
  		UserMailer.estimate_request(@user).deliver_now
  		flash["alert alert-success"] = "You will be contacted shortly about an estimate. Thank you!"
  		redirect_to users_path
  	else
  		flash["alert alert-danger"] = "Please make sure your email is correct and you have input a name"
  		redirect_to users_path
  	end
  end


  private

  def create_user_params
  	params.require(:user).permit(:email, :phone_number, :name)
  end
end
