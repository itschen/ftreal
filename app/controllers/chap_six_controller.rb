class ChapSixController < ApplicationController

 def map
   @parcels= Parcel.find :all,
                         :conditions=>"lat IS NOT NULL AND lng IS NOT NULL"

   @parray=Array.new
   @parcels.each do |parcel|
     @parray.push({:latitude=>parcel.lat, :longitude=>parcel.lng,:id=>parcel.id})
   end
 end
end
