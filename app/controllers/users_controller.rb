class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  def show
  end

  def edit
  end

  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to root_path, notice: 'User_Edit was successfully updated.' }
        # format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        # format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  private
   def set_user
    @user = User.find(params[:id])
   end

   def user_params
    params.require(:user).permit(
      :name,
      :email,
      :avatar,
      profile_attributes: [:id, :nickname]
      # ここでの『id』は親のidを渡している。理由は更新する時の為（今回の場合、user_idとなる）
    )
  end
end
