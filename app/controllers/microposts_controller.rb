class MicropostsController < ApplicationController
  before_action :require_user_logged_in
  before_action :correct_user, only: [:destroy]
  
  def show
    @micropost = Micropost.find(params[:id])
    @reply = Reply.new(micropost_id: @micropost.id)
    @replies = @micropost.replies
  end

  
  def create
    #binding.pry
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @microposts = current_user.microposts.order('created_at DESC').page(params[:page])
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
    @micropost.destroy
    flash[:success] = 'メッセージを削除しました。'
    redirect_back(fallback_location: root_path)
  end
  
  def retweet
    p "**********retweet_start**************"
    original_micropost = Micropost.find(params[:id])
    @micropost = current_user.microposts.build(original_id: original_micropost.id)
    @micropost.content = original_micropost.content
    @micropost.picture = original_micropost.picture
    
    if @micropost.save
      flash[:success] = 'リツイートしました。'
      redirect_to current_user
    else
      flash.now[:danger] = 'リツイートに失敗しました。'
      redirect_back(fallback_location: root_url)
    end
    p "**********retweet_end****************"
  end
  
  private
  
  def micropost_params
    params.require(:micropost).permit(:content, :picture)
  end
  
  def correct_user
    @micropost = current_user.microposts.find_by(id: params[:id])
    unless @micropost
    redirect_to root_url
    end
  end
end
