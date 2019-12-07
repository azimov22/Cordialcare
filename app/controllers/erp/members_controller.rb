module Erp
  class MembersController < BaseController
    def index
      @members = Member.all

      unless['', 'all'].include? params.fetch(:membership_id, "all")
        @members = @members.where(membership_id: params[:membership_id])
      end
      unless ['', 'all'].include? params.fetch(:member_role_id, "all")
        @members = @members.where(member_role_id: params[:member_role_id])
      end
      unless ['', 'all'].include? params.fetch(:team_id, "all")
        @members = @members.where(team_id: params[:team_id])
      end
    end

    def new
      @member = Member.new
    end
    def create
      @member = Member.new(permitted_params)
      @member.generate_membership_id
      if @member.save
        redirect_to members_path, notice: "Member #{@member.membership_id} created"
      else
        render "new", notice: "#{@member.errors}"
      end
    end

    private
    def permitted_params
      params.require(:member).permit(:username, :first_name, :last_name,
                                   :email, :birthday, :phone_number, :member_role_id,
                                   :team_id, :gender, :marital_status, :address, :password,
                                   :password_confirmation)
    end
  end
end