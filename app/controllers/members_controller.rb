class MembersController < ApplicationController
  skip_before_action :user_signed_in?, only: :get_members

  Member.delete_all
  def get_members
    @members = Member.where(display_in_stocks: true).order(likes: :desc).take(10)
    render :json => @members
  end

  def change
    member = Member.find(params[:id])
    if member
      if member.display_in_stocks
        member.update(display_in_stocks: false)
      else
        member.update(display_in_stocks: true)
      end
      redirect_to "/member/#{member.id}"
    else
      redirect_to "/stocks", notice: "Что-то пошло не так :("
    end
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
