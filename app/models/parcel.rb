class Parcel < ActiveRecord::Base
  
  def full_address
    "#{street_no} #{street_name} #{street_type} #{street_alpha}, #{city}, #{zip}"
  end
  
end
