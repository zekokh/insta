class MembersController < ApplicationController
  def get_members
    @members = Member.order(likes: :desc).take(10)
    render :json => @members
  end

  def change_dispaly_status

  end

  def member_true
  end

  def member_false
  end
end
