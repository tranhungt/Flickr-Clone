require 'spec_helper'

describe PhotosController, "creating a new photo" do
  integrate_views
  fixtures :photos

  it "should render json object on successful save" do
    Photo.any_instance.stubs(:valid).returns(:true)
    post "create"
    response.should render_template('new')
  end

  it "should render upload page on failed save" do
    Photo.any_instance.stubs(:valid).returns(:false)
    post "create"
    response.should render_template('upload')
  end
end