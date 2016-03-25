# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
locations = Location.create([ {city: 'New York', state: 'NY', zip: '10016'}, {city: 'Tampa', state: 'FL', zip: '33605'}, {city: 'Menlo Park', state: 'CA', zip: '94025'}, {city: 'San Francisco', state: 'CA', zip: '94104'}, {city: 'Charlotte', state: 'NC', zip: '28216'}])
companies = Company.create ([{name: 'Mondo'}, {name:'Kforce'}, {name: 'Robert Half'}, {name: 'Twitch'}, {name: 'Bank of America'}])
company_locations = CompanyLocation.create([{company_id: 1, location_id: 1},{company_id: 1, location_id:4}, {company_id: 2, location_id:2}, {company_id: 2, location_id:4},{company_id:3, location_id:3}, {company_id:4, location_id:4}, {company_id:5, location_id: 5}])
user1 = User.create :name => "Sunjay Dhama", :company_id => 1, :email => "sunjay@example.com", :password => "password"
