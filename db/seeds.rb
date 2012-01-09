#super_admin = Role.create! :name => 'SuperAdmin'
#organization_admin = Role.create! :name => 'OrganizationAdmin'
#location_admin = Role.create! :name => 'LocationAdmin'
#venue_admin = Role.create! :name => 'VenueAdmin'
#basic_user = Role.create! :name => 'BasicUser'
#puts 'Roles have been created'
#
#seeker = OrganizationType.create! :name => 'Seeker', :description => 'Organizations that are looking for fields/locations to rent.'
#provider = OrganizationType.create! :name => 'Field Provider', :description => 'Organizations that are looking to rent fields/locations they own or manage.'
#
#puts 'Setting up user record for Jason'
#jason = User.create! :first_name => 'Jason', :last_name => "Aslakson", :email => 'aslakson@gmail.com', :password => 'password', :password_confirmation => 'password', :zip_code => '02062'
#puts 'New user created: ' << jason.first_name
#
#
#jason.roles << super_admin
#jason.save!
#
#puts 'Setting up user record for Andrew'
#andrew = User.create! :first_name => 'Andrew', :last_name => 'Aslakson', :email => 'jason_aslakson@yahoo.com', :password => 'password', :password_confirmation => 'password', :zip_code => '02081'
#puts 'New user created: ' << andrew.first_name
#
#andrew.roles << basic_user
#andrew.save!
#
#walpoleRec = Organization.create! :name => 'Walpole Rec', :description => 'Walpoles finest', 
#:email => 'walpolerec@walpole.ma', :address_1 => '1 main street', :city => 'Walpole', 
#:state => 'MA', :zip_code => '02081', :telephone => '888-555-1212', :organization_type_id => provider.id
#puts 'New organization created: ' << walpoleRec.name
#
#walpoleRecAdmin = OrganizationUser.create! :organization_id => walpoleRec.id, :user_id => jason.id, :role_id => super_admin.id
#
#walpoleHigh = Location.create! :name => 'Walpole High School', :description => 'All your sporting needs in one location', 
#:address_1 => '275 Common Street', :city => 'Walpole', :state => 'MA', 
#:zip_code => '02081', :telephone => '888-555-1234', :organization_id => walpoleRec.id
#puts 'New location created: ' << walpoleHigh.name
#
#walpoleSoccer = Venue.create! :name => 'Varsity Soccer Field', :description => 'The big field with circles and big nets - used for official games', 
#:url => 'http://soccer.walpolehigh.edu', :email => 'walpoleSoccer@walpolehigh.edu', :location_id => walpoleHigh.id,
#:hourly_rate => '20000'
#puts 'New venue created: ' << walpoleSoccer.name
#
#walpoleSoccer = Venue.create! :name => 'Practice Soccer Field', :description => 'The big field with circles and big nets - great for practices and JV teams', 
#:url => 'http://soccer.walpolehigh.edu', :email => 'walpoleSoccer@walpolehigh.edu', :location_id => walpoleHigh.id,
#:hourly_rate => '12000'
#puts 'New venue created: ' << walpoleSoccer.name
#
#aslaksons = Organization.create! :name => 'Aslaksons', :description => 'The best family in the world', 
#:email => 'aslakson@gmail.com', :address_1 => '2 Maude Terrace', :city => 'Walpole', 
#:state => 'MA', :zip_code => '02081', :telephone => '508-668-6707'
#puts 'New organization created: ' << aslaksons.name
#
#jasonsHouse = Location.create! :name => 'Jason\'s house', :description => 'Tiny soccer field in the back yard', 
#:address_1 => '2 maude terrace', :city => 'Walpole', :state => 'MA', 
#:zip_code => '02081', :telephone => '508-668-6707', :organization_id => aslaksons.id
#puts 'New location created: ' << jasonsHouse.name
#
#backyard = Venue.create! :name => 'Backyard Soccer Field', :description => 'A tiny field with tiny little nets', 
#:url => 'http://unfamiliarterritory.net', :email => 'jason@unfamiliarterritory.net', :location_id => jasonsHouse.id,
#:hourly_rate => '19995'
#puts 'New venue created: ' << backyard.name
#
#shamrocks = Organization.create! :name => 'Shamrock Pub Soccer Team', :description => 'Norwood townies with a sprinkling of other losers', 
#:email =>"aslaksonjason@gmail.com", :address_1 => '22 Railroad Ave', :city => 'Norwood', 
#:state => 'MA', :zip_code => '02062', :telephone => '508-668-6707', :organization_type_id => seeker.id
#
#soccer = Activity.create! :name => 'Soccer', :description => 'Most people call it football'
#puts 'New activity created: ' << soccer.name
#
#ref = Service.create! :name => 'Referree', :description => 'The guy with the whistle and funny hat'
#puts 'New service created: ' << ref.name
#
#wifi = Ammenity.create! :name => 'Free WiFi', :description => 'Something to keep the kiddies happy during the game.'
#puts 'New ammenity created: ' << wifi.name
#
#sixVsix = Facet.create! :name => '6v6 Soccer', :description => 'This soccer field is equipped for 6v6 play', :activity_id => soccer.id
#grass = Facet.create! :name => 'Grass Field', :description => 'Natural grass surface', :activity_id => soccer.id
#turf = Facet.create! :name => 'Artificial Grass', :description => 'Artificial grass that feels like the real thing', :activity_id => soccer.id
#
#walpoleSoccer.activities << soccer
#walpoleSoccer.services << ref
#walpoleSoccer.ammenities << wifi
#walpoleSoccer.facets << sixVsix
#walpoleSoccer.facets << turf
#walpoleSoccer.save!
#
#backyard.activities << soccer
#backyard.ammenities << wifi
#backyard.facets << sixVsix
#backyard.facets << grass
#backyard.save!

seed_file = File.join(Rails.root, 'db', 'seeds.yml')
config = YAML::load_file(seed_file)
activities = Activity.create(config["activities"])
services = Service.create(config["services"])
ammenities = Ammenity.create(config["ammenities"])
facets = Facet.create(config["facets"])
roles = Role.create(config["roles"])
users = User.create(config["users"])
organization_types = OrganizationType.create(config["organization_types"])
organizations = Organization.create(config["organizations"])
locations = Location.create(config["locations"])
venues = Venue.create(config["venues"])

venues.each do |v|
  v.ammenities << ammenities.first
  v.activities << activities.first
  v.facets << facets.first
  v.facets << facets.last
  v.services << services.first
  v.save!
end


states = State.create([
  { :name => 'Alabama', :abbr => 'AL', :ansi_code => '1', :statens => '1779775'},
  { :name => 'Alaska', :abbr => 'AK', :ansi_code => '2', :statens => '1785533'},
  { :name => 'Arizona', :abbr => 'AZ', :ansi_code => '4', :statens => '1779777'},
  { :name => 'Arkansas', :abbr => 'AR', :ansi_code => '5', :statens => '68085'},
  { :name => 'California', :abbr => 'CA', :ansi_code => '6', :statens => '1779778'},
  { :name => 'Colorado', :abbr => 'CO', :ansi_code => '8', :statens => '1779779'},
  { :name => 'Connecticut', :abbr => 'CT', :ansi_code => '9', :statens => '1779780'},
  { :name => 'Delaware', :abbr => 'DE', :ansi_code => '10', :statens => '1779781'},
  { :name => 'District of Columbia', :abbr => 'DC', :ansi_code => '11', :statens => '1702382'},
  { :name => 'Florida', :abbr => 'FL', :ansi_code => '12', :statens => '294478'},
  { :name => 'Georgia', :abbr => 'GA', :ansi_code => '13', :statens => '1705317'},
  { :name => 'Hawaii', :abbr => 'HI', :ansi_code => '15', :statens => '1779782'},
  { :name => 'Idaho', :abbr => 'ID', :ansi_code => '16', :statens => '1779783'},
  { :name => 'Illinois', :abbr => 'IL', :ansi_code => '17', :statens => '1779784'},
  { :name => 'Indiana', :abbr => 'IN', :ansi_code => '18', :statens => '448508'},
  { :name => 'Iowa', :abbr => 'IA', :ansi_code => '19', :statens => '1779785'},
  { :name => 'Kansas', :abbr => 'KS', :ansi_code => '20', :statens => '481813'},
  { :name => 'Kentucky', :abbr => 'KY', :ansi_code => '21', :statens => '1779786'},
  { :name => 'Louisiana', :abbr => 'LA', :ansi_code => '22', :statens => '1629543'},
  { :name => 'Maine', :abbr => 'ME', :ansi_code => '23', :statens => '1779787'},
  { :name => 'Maryland', :abbr => 'MD', :ansi_code => '24', :statens => '1714934'},
  { :name => 'Massachusetts', :abbr => 'MA', :ansi_code => '25', :statens => '606926'},
  { :name => 'Michigan', :abbr => 'MI', :ansi_code => '26', :statens => '1779789'},
  { :name => 'Minnesota', :abbr => 'MN', :ansi_code => '27', :statens => '662849'},
  { :name => 'Mississippi', :abbr => 'MS', :ansi_code => '28', :statens => '1779790'},
  { :name => 'Missouri', :abbr => 'MO', :ansi_code => '29', :statens => '1779791'},
  { :name => 'Montana', :abbr => 'MT', :ansi_code => '30', :statens => '767982'},
  { :name => 'Nebraska', :abbr => 'NE', :ansi_code => '31', :statens => '1779792'},
  { :name => 'Nevada', :abbr => 'NV', :ansi_code => '32', :statens => '1779793'},
  { :name => 'New Hampshire', :abbr => 'NH', :ansi_code => '33', :statens => '1779794'},
  { :name => 'New Jersey', :abbr => 'NJ', :ansi_code => '34', :statens => '1779795'},
  { :name => 'New Mexico', :abbr => 'NM', :ansi_code => '35', :statens => '897535'},
  { :name => 'New York', :abbr => 'NY', :ansi_code => '36', :statens => '1779796'},
  { :name => 'North Carolina', :abbr => 'NC', :ansi_code => '37', :statens => '1027616'},
  { :name => 'North Dakota', :abbr => 'ND', :ansi_code => '38', :statens => '1779797'},
  { :name => 'Ohio', :abbr => 'OH', :ansi_code => '39', :statens => '1085497'},
  { :name => 'Oklahoma', :abbr => 'OK', :ansi_code => '40', :statens => '1102857'},
  { :name => 'Oregon', :abbr => 'OR', :ansi_code => '41', :statens => '1155107'},
  { :name => 'Pennsylvania', :abbr => 'PA', :ansi_code => '42', :statens => '1779798'},
  { :name => 'Rhode Island', :abbr => 'RI', :ansi_code => '44', :statens => '1219835'},
  { :name => 'South Carolina', :abbr => 'SC', :ansi_code => '45', :statens => '1779799'},
  { :name => 'South Dakota', :abbr => 'SD', :ansi_code => '46', :statens => '1785534'},
  { :name => 'Tennessee', :abbr => 'TN', :ansi_code => '47', :statens => '1325873'},
  { :name => 'Texas', :abbr => 'TX', :ansi_code => '48', :statens => '1779801'},
  { :name => 'Utah', :abbr => 'UT', :ansi_code => '49', :statens => '1455989'},
  { :name => 'Vermont', :abbr => 'VT', :ansi_code => '50', :statens => '1779802'},
  { :name => 'Virginia', :abbr => 'VA', :ansi_code => '51', :statens => '1779803'},
  { :name => 'Washington', :abbr => 'WA', :ansi_code => '53', :statens => '1779804'},
  { :name => 'West Virginia', :abbr => 'WV', :ansi_code => '54', :statens => '1779805'},
  { :name => 'Wisconsin', :abbr => 'WI', :ansi_code => '55', :statens => '1779806'},
  { :name => 'Wyoming', :abbr => 'WY', :ansi_code => '56', :statens => '1779807'}
])