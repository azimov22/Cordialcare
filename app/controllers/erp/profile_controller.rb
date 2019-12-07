module Erp
  class ProfileController < BaseController
    require 'date_extensions'
    def index
      @profile = Member.find_by(id: current_member.id)
    end
  end
end