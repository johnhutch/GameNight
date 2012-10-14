class UsersController < ApplicationController
  load_and_authorize_resource
  autocomplete :game, :name, :full => true
    
  def index
    @users = User.all
  end
  
  def show
    @user = User.find(params[:id])
  end
  
  def friend_request
    @user = User.find(params[:id])
    current_user.friends << @user

    respond_to do |format|
        format.html { redirect_to(@user, :notice => t('flash.friend_request_sent'))}
        format.xml  { head :ok }
    end
  end

  def edit
    @user = User.find(params[:id])
    @all_roles = Role.find(:all)
  end
  
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @user.errors, :status => :unprocessable_entity }
      end
    end
  end

  def games
    @user = User.find(params[:id])
  end

  def add_game
    @user = User.find(params[:id])
    

    respond_to do |format|
      format.html { redirect_to(games_user_path, :notice => 'Game added.') }
    end
  end
  
  # DELETE /videos/1
  # DELETE /videos/1.xml
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to(root, :notice => "User has been deleted.") }
      format.xml  { head :ok }
    end
  end

end
