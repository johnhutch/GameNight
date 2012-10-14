class FriendshipsController < ApplicationController
    load_and_authorize_resource

    def create
        @user = User.find(params[:friend_id])
        @friendship = current_user.friendships.build(:friend_id => params[:friend_id])
        respond_to do |format|
            if @friendship.save
                format.html { redirect_to(@user, :notice => 'Friendship added.') }
                format.xml  { head :ok }
            else
                format.html { redirect_to(@user, :notice => 'Unable to add friendship.') }
                format.xml  { render :xml => @Friendship.errors, :status => :unprocessable_entity }
            end
        end

        def destroy
            @friendship = current_user.friendships.find(params[:id])
            @friendship.destroy
            flash[:notice] = "Removed friendship."
            redirect_to current_user
        end

    end
