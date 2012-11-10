class NightsController < ApplicationController
  #load_and_authorize_resource
  # GET /nights
  # GET /nights.json
  def index
    @nights = Night.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @nights }
    end
  end

  # GET /nights/1
  # GET /nights/1.json
  def show
    @night = Night.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @night }
    end
  end

  # GET /nights/new
  # GET /nights/new.json
  def new
    @night = Night.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @night }
    end
  end

  # GET /nights/1/edit
  def edit
    @night = Night.find(params[:id])
  end

  # POST /nights
  # POST /nights.json
  def create
    @night = current_user.nights.build(params[:night])

    respond_to do |format|
      if current_user.save
        format.html { redirect_to @night, notice: t('flash.night_created') }
        format.json { render json: @night, status: :created }
      else
        format.html { redirect_to dashboard_path, notice: t('flash.night_creation_problem') }
        format.json { render json: @night.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /nights/1
  # PUT /nights/1.json
  def update
    @night = Night.find(params[:id])

    respond_to do |format|
      if @night.update_attributes(params[:night])
        format.html { redirect_to @night, notice: 'Night was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @night.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /nights/1
  # DELETE /nights/1.json
  def destroy
    @night = Night.find(params[:id])
    if @night.users.empty?
        @night.destroy
        msg = t('flash.night_deleted')
    else
        current_user.nights.delete(@night)
        msg = t('flash.night_removed')
    end

    respond_to do |format|
      format.html { redirect_to dashboard_path, notice: msg }
      format.json { head :no_content }
    end
  end
end
