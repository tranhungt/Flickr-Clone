require 'spec_helper'

describe PhotosController, "creating a new photo" do

  before(:each) do
    user = FactoryGirl.create(:user)
    sign_in(user)
  end

  describe "GET #index" do
    let(:photo){ FactoryGirl.create(:photo)}
      
    it "populates the first page of images" do
      get :index
      assigns(:photos).should eq([photo])
    end

    it "renders the :index view" do
      get :index
      response.should render_template(:index)
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

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new photo into the database"
      it "renders json"
    end

    context "with invalid attributes" do
      it "does not save photo to database"
      it "re-renders the :upload"
    end 
  end

  describe "GET #new" do 
    it "renders :new template" do
      get :new
      response.should render_template(:new)
    end
  end
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