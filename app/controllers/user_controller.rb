class UserController < ApplicationController

  before_action :authenticate_user!

  def index
    if user_signed_in?
      if current_user.admin
        @users = User.all;
      end
    end
  end

  def destroy
    if user_signed_in?
      if current_user.admin
        User.find(params[:id]).destroy;
      end
    end
    redirect_to user_index_path;
  end

  def edit
    if user_signed_in?
      if current_user.admin
        user = User.find(params[:id]);
        if user.admin
          user.admin = false;
        else
          user.admin = true;
        end
      end
    end
    user.save;
    redirect_to user_index_path;
  end

end
