class MembersController < ApplicationController
  def get_members
    @members = Member.order(likes: :desc).take(10)
    render :json => @members
  end

  def change
    member = Member.find(params[:id])
    member.display_in_stocks= true
    member.save
    redirect_to "/member/#{member.id}"
  end

  def member_true
    @members_true = Member.where(display_in_stocks: true)
  end

  def member_false
    @members_false = Member.where(display_in_stocks: false)
  end

  def show
    @member = Member.find(params[:id])
  end
end
