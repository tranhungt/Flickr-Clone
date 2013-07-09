class AccountsController < ApplicationController
  before_filter :authenticate_user!
  def edit
    @user = current_user
  end
  def update
    @user = current_user
    @user.update_attributes(params[:user])
    @user.photostream.update_attributes(:username => @user.username)

    render :edit
  end
  def show
    @user = current_user
  end
end
