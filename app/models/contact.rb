class Contact < ActiveRecord::Base

  def full_address
    "#{street_no} #{street_dir} #{street_name} #{street_type}, #{city}, #{zip}"
  end

end
