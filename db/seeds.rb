require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'ny1300k.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  busz = Business.new

  busz.name = row['name']
  busz.city = row['city']
  busz.state = row['state']
  busz.zipcode = row['zipcode']
  busz.address1 = row['address1']
  busz.address2 = row['address2']
  busz.category1_id = row['category1_id']
  busz.category2_id = row['category2_id']
  busz.category3_id = row['category3_id']
  busz.category1 = row['category1']
  busz.category2 = row['category2']
  busz.category3 = row['category3']
  busz.phone = row['phone']
  busz.website = row['website']
  busz.longitude = row['longitude']
  busz.latitude = row['latitude']
  busz.save
  
  puts "Business saved"
end

puts "There are now #{Business.count} rows in the transactions table"