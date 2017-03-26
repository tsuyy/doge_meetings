class InvitesController < ApplicationController
  def create
    invite = Invite.new(invite_params)
    p "--------------INVITE  CREATE--------------", invite
    if invite.save
      redirect_to user_path(current_user)
    else
      flash[:error] = "Bad Invite"
      redirect_to root_path
    end
        
  end

  def update
    invite = Invite.where(id: params[:id])
    p "--------------INVITE  UPDATE--------------", invite
    if !invite
      flash[:error] = "Bad Invite"
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
