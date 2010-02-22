class ChapFiveController < ApplicationController

def map
 @parcels=Parcel.find :all,
                      :conditions=>"lat IS NOT NULL"
 
 @parray=Array.new
 @parcels.each do |parcel|
   if parcel.lat != nil
     @parray.push({:latitude=>parcel.lat, :longitude=>parcel.lng, :id=>parcel.id, :address=>parcel.street_no+" "+parcel.street_name})
   end
 end
 
end
 
end
