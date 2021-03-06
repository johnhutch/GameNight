class FriendshipsController < ApplicationController
    load_and_authorize_resource

    def create
        @user = User.find(params[:friend_id])
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        respond_to do |format|
            if @friendship.save
                NightMailer.friended_email(@user, current_user).deliver
                format.html { redirect_to(@user, :notice => t('flash.friendship_added')) }
                format.xml  { head :ok }
            else
                format.html { redirect_to(@user, :notice => t('flash.friendship_problem')) }
                format.xml  { render :xml => @Friendship.errors, :status => :unprocessable_entity }
            end
        end
    end

    def destroy
        @friendship = current_user.friendships.find(params[:id])
        @friendship.destroy
        flash[:notice] = t('flash.removed_friendship')
        redirect_to current_user
    end

    end
