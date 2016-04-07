class CommentsController < ApplicationController
  def create
    part = Part.find(params[:part_id])
    @comment = part.comments.create(comment_params.merge(user: current_user))

    respond_to do |format|
      format.html {redirect_to part}
      format.js{}
  end
end

  def destroy
    @comment = part.comments.find(params[:id])
    @comment.destroy
      format.html {redirect_to part}
      format.js{}
  end

private
def comment_params
  params.require(:comment).permit(:content)
  end
end
