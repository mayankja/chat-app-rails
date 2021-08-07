
class UsersController < ApplicationController

  before_action :authenticate_user!
  
  def list       
    users = User.where.not(uid: current_user.uid)
    render json: users, each_serializer: UserSerializer
  end
end