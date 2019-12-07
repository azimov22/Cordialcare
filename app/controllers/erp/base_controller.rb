module Erp
  class BaseController < ApplicationController
    require 'date_extensions'
    layout "erp"

    before_action :authenticate_member!


    def after_sign_in_path_for(resource)
      root_path
    end

  end
end