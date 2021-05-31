class PagesController < ApplicationController
  skip_before_action :authenticate_developer!, only: :home
  skip_before_action :authenticate_customer!, only: :home
  def home
  end
end
