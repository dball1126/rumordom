json.extract! business, :id, :name, :full_address, :address1, :city, :state, :zipcode, :latitude, :longitude, :created_at, :updated_at
json.url business_url(business, format: :json)