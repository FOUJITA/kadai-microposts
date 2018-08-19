class RepliesController < ApplicationController
  before_action :require_user_logged_in
  def create
    @reply = current_user.replies.build(reply_params)
    @micropost = @reply.micropost
    if @reply.save
      flash[:success] = "このツイートに返信しました。"
      redirect_to @micropost
    else
      @replies = @micropost.replies
      flash.now[:danger] = "返信できませんでした。"
      render 'microposts/show'
    end
  end

  private

  def reply_params
    params.require(:reply).permit(:content, :micropost_id)
  end
end