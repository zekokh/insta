class MembersController < ApplicationController
  def get_members
    @members = Member.order(likes: :desc).take(10)
    render :json => @members
  end

  def change_dispaly_status

  end

  def member_true
    @members_true = Member.where(display_in_stocks: true)
  end

  def member_false
    @members_false = Member.where(display_in_stocks: false)
  end

  def show
    @member = Member.find_by(id: params[:id])
  end
end
