class UsersController < ApplicationController
  before_action :move_to_index, except: [:index, :show]


  def index
  end

  def new
    @user = User.new 
  end

  def show
    @user = User.find(params[:id])
    @prototypes = @user.prototypes
  end

  def edit
  end

  def update
    current_user.update(user_params)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile, :occupation, :position).merge(user_id: current_user.id)
  end

end
