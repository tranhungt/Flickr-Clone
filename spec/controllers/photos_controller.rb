require 'spec_helper'

describe PhotosController, "creating a new photo" do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
  end
  # integrate_views
  # fixtures :photos

  # it "should render json object on successful save" do
  #   Photo.any_instance.stubs(:valid).returns(:true)
  #   post "create"
  #   response.should render_template('new')
  # end

  # it "should render upload page on failed save" do
  #   Photo.any_instance.stubs(:valid).returns(:false)
  #   post "create"
  #   response.should render_template('upload')
  # end
  describe "GET #index" do
    it "populates the first page of images" do
      
    end

    it "renders the :index view" do

    end
  end

  describe "GET #show" do
    let(:photo){ FactoryGirl.create(:photo)}

    it "shows the specified photo" do
      get :show, id: photo
      assigns(:photo).should eq(photo)
    end
    it "renders the :show view" do
      get :show, id: photo
      response.should render_template(:show)
    end
  end
end