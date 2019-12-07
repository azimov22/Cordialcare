class ErpDeviseController < ApplicationController
  layout :layout_by_resource

  def after_sign_out_path_for(resource)
    root_path
  end

  def layout_by_resource
    "erp.devise"
  end
end