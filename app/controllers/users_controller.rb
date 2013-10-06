class UsersController < ApplicationController

	def show
		@user = User.find(1)
	end

  def new
		@user = User.new
  end
end
