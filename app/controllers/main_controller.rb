class MainController < ApplicationController
  before_filter :not_authenticated
  def index
  end
end