class PrototypesController < ApplicationController
  before_action :move_to_index,  except: [:index, :show]
  
  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      redirect_to root_path(@prototype)
    else
      render :new
      @prototype = Prototype.includes(:user)
    end
  end

  def show
    @prototype = Prototype.find(params[:id])
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.save
      prototype.update(prototype_params)
      redirect_to root_path
    else
      render  :edit
    end
  end

  def destroy
    prototype = Prototype.find(params[:id])
    prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
     redirect_to action: :index
    end
  end


  def move_to_edit
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_update
    unless user_signed_in?
      redirect_to action: :index
    end
  end

  def move_to_destroy
    unless user_signed_in?
      redirect_to action: :index
    end
  end
  

end