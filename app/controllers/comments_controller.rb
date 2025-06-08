class CommentsController < ApplicationController
  def create
    @park = Park.find(params[:park_id])
    @comment = @park.comments.build(comment_params)

    if @comment.save
      redirect_to park_path(@park), notice: "コメントを投稿しました"
    else
      @comments = @park.comments.order(created_at: :desc)
      render 'parks/show', status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
