module Erp
  class HomeController < BaseController

    def index
      @sales = Sale.all.limit(5)
      @members = Member.all
    end
  end
end