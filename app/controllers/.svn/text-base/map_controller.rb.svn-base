class MapController < ApplicationController
  def index
    @parcels = Parcel.find :all, \
      :conditions => ['lat<? AND lng>? AND lat>? AND lng<?', 38.85, -77.06, 38.83, -77.05]
    @zips = @parcels.collect {|parcel| parcel.zip}.uniq
  end
end
