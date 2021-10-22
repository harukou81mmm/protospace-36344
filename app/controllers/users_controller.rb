class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @name = current_user.name
    @prototypes = current_user.prototypes
    @profile = current_user.profile
    @occupation = current_user.occupation
    @position = current_user.position
  end

  def edit
  end

  def update
    current_user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id)
  end

end
