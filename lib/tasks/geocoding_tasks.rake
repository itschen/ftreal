require 'open-uri'
require 'rexml/document'

# Retrieve geocode information for all records in the parcels table
task :google_geocode => :environment do
  api_key="ABQIAAAAo9c4AXPvLrk-39gbbp74hxTJQa0g3IQ9GZqIMmInSLzwtGDKaBQzOT70RVXnhhYuNhurp-dlUCeRqA"
  
  (Parcel.find :all, :conditions=>"street_name = 'PRINCE' and street_no>1300 and lat IS NULL").each do |parcel|

    puts "Parcel address: #{parcel.full_address}"
    
    xml = open("http://maps.google.com/maps/geo?q=#{CGI.escape(parcel.full_address)}&output=xml&key=#{api_key}").read
    
    doc = REXML::Document.new(xml)
    
    puts "Status: " + doc.elements['//kml/Response/Status/code'].text
    if doc.elements['//kml/Response/Status/code'].text != '200'
      puts "Unable to parse Google response for #{parcel.acct_no}"
    else
      lng,lat = doc.root.elements['//coordinates'].text.split(',')
      parcel.lat = lat
      parcel.lng = lng
      parcel.save
      puts "latitude = #{lat}, longitude = #{lng}"
    end # end if result == 200
  end # end each parcel
end # end rake task
    
# Output geocoded parcel information for all records into a txt file
task :output_geocode => :environment do
  out = File.new("dats/CAMAExports/parcels_geocoded.txt", "w")
  
  (Parcel.find :all).each do |parcel|
    out.puts [parcel.acct_no, parcel.parcel_no, parcel.acct_type, parcel.biz_name, \
      parcel.address, parcel.city, parcel.state, parcel.zip, parcel.lat, parcel.lng, \
      parcel.act_value, parcel.sqft, parcel.zoning].join('|')
  end # end each parcel
  out.close
end # end rake task