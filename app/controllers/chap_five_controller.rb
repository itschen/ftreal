class ChapFiveController < ApplicationController

def map
 @parcels=Parcel.find :all,
                      :conditions=>"lat IS NOT NULL AND acct_type='COMMERCIAL'"
 
 @parray=Array.new
 @parcels.each do |parcel|
     @parray.push({:latitude=>parcel.lat, :longitude=>parcel.lng, :id=>parcel.id, :address=>parcel.street_no+" "+parcel.street_name, :lotsize=>parcel.lotsf})

end
 
end
 
end
