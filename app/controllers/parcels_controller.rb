class ParcelsController < ApplicationController
  # GET /parcels
  # GET /parcels.xml
  def index
    @parcels = Parcel.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @parcels }
    end
  end

  # GET /parcels/1
  # GET /parcels/1.xml
  def show
    @parcel = Parcel.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @parcel }
    end
  end

  # GET /parcels/new
  # GET /parcels/new.xml
  def new
    @parcel = Parcel.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @parcel }
    end
  end

  # GET /parcels/1/edit
  def edit
    @parcel = Parcel.find(params[:id])
  end

  # POST /parcels
  # POST /parcels.xml
  def create
    @parcel = Parcel.new(params[:parcel])

    respond_to do |format|
      if @parcel.save
        flash[:notice] = 'Parcel was successfully created.'
        format.html { redirect_to(@parcel) }
        format.xml  { render :xml => @parcel, :status => :created, :location => @parcel }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @parcel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /parcels/1
  # PUT /parcels/1.xml
  def update
    @parcel = Parcel.find(params[:id])

    respond_to do |format|
      if @parcel.update_attributes(params[:parcel])
        flash[:notice] = 'Parcel was successfully updated.'
        format.html { redirect_to(@parcel) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @parcel.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /parcels/1
  # DELETE /parcels/1.xml
  def destroy
    @parcel = Parcel.find(params[:id])
    @parcel.destroy

    respond_to do |format|
      format.html { redirect_to(parcels_url) }
      format.xml  { head :ok }
    end
  end
end
