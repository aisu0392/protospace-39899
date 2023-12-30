class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:prototype_id])
    @comment = @prototype.comments.build(comment_params)
    @comment.user = current_user # ログインユーザーをコメントのユーザーとして設定する例

    if @comment.save
      redirect_to @prototype, notice: 'コメントが投稿されました'
    else
      flash.now[:alert] = 'コメントの投稿に失敗しました'
      render 'prototypes/show'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype_id])
  end
end
