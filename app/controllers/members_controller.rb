class MembersController < ApplicationController
  skip_before_action :user_signed_in?, only: :get_members

  #Member.delete_all
  def get_members
    #@members = Member.where(display_in_stocks: true).order(likes: :desc).take(10)
    #render :json => @members
    @all = Member.where(display_in_stocks: true).order(likes: :desc)
    count = @all.count
    if count <= 9
      @members = Member.where(display_in_stocks: true).order(likes: :desc).take(10)
    elsif count > 10
      first = (count - 9)/2
      @members = Member.where(display_in_stocks: true).order(likes: :desc).limit(9).offset(first)
    end

    render :json => @members
  end

  def get_middle_members
    @all = Member.where(display_in_stocks: true).order(likes: :desc)
    count = @all.count
    if count <= 9
      @members = Member.where(display_in_stocks: true).order(likes: :desc).take(10)
    elsif count > 10
        first = (count - 9)/2
        @members = Member.where(display_in_stocks: true).order(likes: :desc).limit(9).offset(first)
    end

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
    @members_true = Member.where(display_in_stocks: true).order(likes: :desc)
  end

  def member_false
    @members_false = Member.where(display_in_stocks: false).order(likes: :desc)
  end

  def show
    @member = Member.find(params[:id])
  end
end
