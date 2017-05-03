class GroupsController < ApplicationController

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice:  "グループ作成成功"
    else
      flash.now[:alert] = "グループ作成失敗"
      render action: :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name,user_ids:[])
  end

end
