class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comments = @prototype.comments
    @comment.user = current_user # ログインユーザーをコメントのユーザーとして設定する例

    if @comment.save
      redirect_to @prototype
    else
      render 'prototypes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
