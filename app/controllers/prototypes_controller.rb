class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]
  before_action :ensure_owner, only: [:edit]
  before_action :authenticate_user!, except: [:top, :show, :new, :create, :index]

  def index
    @prototypes = Prototype.all
  end

  def new
    @prototype = Prototype.new
  end

  def show
    @prototype = Prototype.includes(:user).find(params[:id])
    @comments = @prototype.comments
    @comment = Comment.new
  end

  def create
    @prototype = Prototype.new(prototype_params)
    @prototype.user_id = current_user.id
    if @prototype.save
      # 保存が成功した場合の処理
      redirect_to root_path
    else
      # 保存に失敗した場合の処理
      render :new
    end
  end

  def edit
    @prototype = Prototype.find(params[:id])
  end

  def update
    @prototype = Prototype.find(params[:id])
    if @prototype.update(prototype_params)
      redirect_to @prototype, notice: 'Prototype was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @prototype = Prototype.find(params[:id])
    @prototype.destroy
    redirect_to root_path
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image)
  end

  def ensure_owner
    unless @prototype.user == current_user
      redirect_to root_path, alert: "You don't have permission to access this page."
    end
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

end
