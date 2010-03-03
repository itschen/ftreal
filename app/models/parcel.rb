class Parcel < ActiveRecord::Base
  
  def full_address
    "#{street_no} #{street_name} #{street_type} #{street_alpha}, #{city}, #{zip}"
  end
  
  def pertinent_info
    "Acres: #{acres}, Lot SF:#{lotsf}, Gross SF:#{grossf} Year Built:#{yr_blt}, Stories:#{stories}"
  end
  
end
