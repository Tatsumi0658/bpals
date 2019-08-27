class UsersController < ApplicationController
  def index
    @users = User.where.not(id:current_user.id).order("id")
  end

  def edit
    @user = User.find(params[:id])
    if @user.admin_flag == true
      @user.admin_flag = false
      @user.save
      redirect_to users_path, notice: t('view.alert.update')
    else
      @user.admin_flag = true
      @user.save
      redirect_to users_path, notice: t('view.alert.update')
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to users_path, notice: t('view.alert.delete')
  end
end
