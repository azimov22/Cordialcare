module Erp
  class NonMembersController < BaseController
    def index
      @non_members = NonMember.all
    end
  end
end