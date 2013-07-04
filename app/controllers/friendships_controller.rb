class FriendshipsController < ApplicationController
    def create
    @friendship = current_user.friendships.build(params[:friendship])
    @friendship.save
    render json: @favorite
  end

  def destroy
    puts params
    puts ''
    puts ''
    puts ''
    @friendship = Friendship.where(:user_id => current_user.id,
                                :friend_id => params[:friendship][:friend_id]
                                )[0]

    @friendship.destroy
    render json: @friendship
    # redirect_to root_url
  end
end
