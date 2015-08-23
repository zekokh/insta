class MembersController < ApplicationController
  def get_members
    @members = Member.order(likes: :desc).take(10)
    render :json => @members
  end
end
