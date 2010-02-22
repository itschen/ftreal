puts "Starting..."

# Open "ExportZoning.txt" and "ExportValueDetail.txt" and
# read them into a large hash of lines
zonings = Hash.new
IO.foreach('ExportZoning.txt') do |line|
  fields = line.split(',')
  id = fields[0]
  zonings[id] = fields
end
puts "#{zonings.size} zonings" 

value_details = Hash.new
IO.foreach('ExportValueDetail.txt') do |line|
  fields = line.split(',')
  id = fields[0]
  value_type = fields[2]
  if value_type == %Q("LAND")
    value_details[id] = fields
  end
end
puts "#{value_details.size} value_details"

# Open the output file
out = File.new('parcels.dat', "w")

# Open "ExportAccount.txt", iterate through it, 
# and correlate with hashes from other two files
count = 0
IO.foreach('ExportAccount.txt') do |line|
  a_fields = line.split(',')
  id = a_fields[0]
  z_fields = zonings[id]
  v_fields = value_details[id]
  
  if z_fields && v_fields
    parcel_no, acct_type, address, city, zip, biz_name, act_value \
    = a_fields.values_at(1,2,8,9,10,11,18)
    
    # remove double quotes on some data columns
    id = id.gsub("\"", '')
    parcel_no = parcel_no.gsub("\"", '')
    acct_type = acct_type.gsub("\"", '')
    biz_name = biz_name.gsub("\"", '')
    address = address.gsub("\"", '')
    city = city.gsub("\"", '')
    zip = zip.gsub("\"", '')
    
    state = "VA"
    zoning = z_fields[2].gsub("\"", '')
    sqft = v_fields[6]
  
    if acct_type == "COMMERCIAL"
      out.puts [id, parcel_no, acct_type, biz_name, address, city,\
        state, zip, act_value, sqft, zoning].join('|')
      count += 1
    end
  end
end
puts "#{count} parcels"

out.close
puts "Done"

# MySQLImport command
# mysqlimport --delete --fields-terminated-by="|" 
# --columns=acct_no,parcel_no,acct_type,biz_name,address,city,state,zip,act_value,sqft,zoning
# --user=root --local ftreal_development parcels.dat

