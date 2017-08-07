class TwitcenterController < ApplicationController
  before_action :authenticate_user!
  
  def feed
    # user_list = current_user.following << current_user.id
    @following_tweets = Tweet.where(user_id: current_user.following << current_user.id).order(updated_at: :desc)
  end

  def show_user
    @user = User.find(params[:id])
  end

  def now_following
    # We are adding the user.id of the user you want to 
    # follow to your following array.
    # and we want to make sure it's saved in there as an integer
    current_user.following.push(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
  end

  def unfollow
    current_user.following.delete(params[:id].to_i)
    current_user.save

    redirect_to show_user_path(id: params[:id])
    
  end
  
  def tag_tweets
    @tag = Tag.find(params[:id])
    @tweets = @tag.tweets
  end
  
  def all_users
    @users = User.all
  end
  
  def following
    @users = User.where(id: current_user.following)
  end
  
  def followers
    @users = []
    User.all.each do |user|
      if user.following.include?(current_user.id)
        @users << user
      end
    end
  end
  
end
