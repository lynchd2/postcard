class StaticPagesController < ApplicationController
  def index
  	@faker_paragraph = Faker::Lorem.paragraph(12)
  	@faker_bullet_point1 = Faker::Lorem.sentence(7)
  	@faker_bullet_point2 = Faker::Lorem.sentence(8)
  	@faker_bullet_point3 = Faker::Lorem.sentence(7)
  	@faker_bullet_point4 = Faker::Lorem.sentence(9)
  	@faker_bullet_point5 = Faker::Lorem.sentence(6)
  	@faker_bullet_point6 = Faker::Lorem.sentence(7)
  	@faker_paragraph2 = Faker::Lorem.paragraph(5)
  	@user = User.new
  end

  def show
  end

  def create
  	@user = User.new(params)
  	@user.create(create_user)
  	if @user.save
  		flash.now[:success] = "You will be contacted shortly about an estimate. Thank you!"
  		render :index
  	else
  		flash.now[:error] = "Please make sure your email is correct and you have input a name"
  		render :index
  	end
  end


  private

  def create_user
  	params.require(:user).permit(:email, :phone_number, :name)
  end
end
