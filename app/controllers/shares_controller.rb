class SharesController < ApplicationController
  before_filter :authenticate_user!, except: [:index, :show]
  # GET /shares
  # GET /shares.json
  def index
    @shares = Share.order("created_at desc")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shares }
    end
  end

  # GET /shares/1
  # GET /shares/1.json
  def show
    @share = Share.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @share }
    end
  end

  # GET /shares/new
  # GET /shares/new.json
  def new
    @share = current_user.shares.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @share }
    end
  end

  # GET /shares/1/edit
  def edit
    @share = current_user.shares.find(params[:id])
  end

  # POST /shares
  # POST /shares.json
  def create
    @share = current_user.shares.new(params[:share])

    respond_to do |format|
      if @share.save
        format.html { redirect_to @share, notice: 'Share was successfully created.' }
        format.json { render json: @share, status: :created, location: @share }
      else
        format.html { render action: "new" }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /shares/1
  # PUT /shares/1.json
  def update
    @share = current_user.shares.find(params[:id])

    respond_to do |format|
      if @share.update_attributes(params[:share])
        format.html { redirect_to @share, notice: 'Share was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @share.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /shares/1
  # DELETE /shares/1.json
  def destroy
    @share = current_user.shares.find(params[:id])
    @share.destroy

    respond_to do |format|
      format.html { redirect_to shares_url }
      format.json { head :no_content }
    end
  end
end
