class CollectionsController < ApplicationController
  def index
    @collections = current_user.collections.includes(:photos)
  end
  def create
    @collection = current_user.collections.build(params[:collection])
    @collection.save!
    render :json => @collection
  end
end
