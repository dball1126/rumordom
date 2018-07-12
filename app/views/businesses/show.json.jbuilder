json.partial! "businesses/business", business: @business
json.extract! @business, :id, :name, :full_address, :address, :city, :state, :zipcode, :latitude, :longitude, :created_at, :updated_at