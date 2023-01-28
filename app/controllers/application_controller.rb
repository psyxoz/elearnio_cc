class ApplicationController < ActionController::Base
  include JSONAPI::ActsAsResourceController
  skip_forgery_protection

  def context
    { params: params }
  end
end
