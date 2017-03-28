class InvitesController < ApplicationController
  def create
    invite = Invite.new(invite_params)
    if logged_in? && invite.save
      flash[:success] = "You've invited #{invite.user.name.capitalize} to a playdate!"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Bad Invite"
      redirect_to root_path
    end
        
  end

  def update
    invite = Invite.where(id: params[:id]).take
    if !logged_in?  || current_user != invite.user
      flash[:error] = "No Can Do"
      redirect_to root_path
    else
      invite.update(invite_params)
      redirect_to user_path(current_user)
    end
  end

  private

  def invite_params
    params.permit(:user_id, :playdate_id, :status, :id)
  end
end
