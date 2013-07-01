class RootController < ApplicationController
  before_filter :authenticate_user!
  def root

  end
end
