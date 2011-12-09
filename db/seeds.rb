puts 'SETTING UP DEFAULT USER LOGIN'
user = User.create! :first_name => 'Jason', :last_name => "Aslakson", :email => 'aslakson@gmail.com', :password => 'jawtm78', :password_confirmation => 'jawtm78', :zip_code => '02062'
puts 'New user created: ' << user.first_name

super_admin = Role.create! :name => 'SuperAdmin'
organization_admin = Role.create! :name => 'OrganizationAdmin'
location_admin = Role.create! :name => 'LocationAdmin'
venue_admin = Role.create! :name => 'VenueAdmin'
basic_user = Role.create! :name => 'BasicUser'
puts 'Roles have been created'

user.roles << super_admin
user.save!

walpoleRec = Organization.create! :name => 'Walpole Rec', :description => 'Walpoles finest', 
:email_address => 'walpolerec@walpole.ma', :address_1 => '1 main street', :city => 'Walpole', 
:state => 'MA', :zip_code => '02081', :telephone => '888-555-1212'
puts 'New organization created: ' << walpoleRec.name

walpoleHigh = Location.create! :name => 'Walpole High School', :description => 'All your sporting needs in one location', 
:address_1 => '275 Common Street', :city => 'Walpole', :state => 'MA', 
:zip_code => '02081', :telephone => '888-555-1234', :organization_id => walpoleRec.id
puts 'New location created: ' << walpoleHigh.name

walpoleSoccer = Venue.create! :name => 'Walpole Soccer Field', :description => 'The big field with circles and big nets', 
:url => 'http://soccer.walpolehigh.edu', :email_address => 'walpoleSoccer@walpolehigh.edu', :location_id => walpoleHigh.id
puts 'New venue created: ' << walpoleSoccer.name

aslaksons = Organization.create! :name => 'Aslaksons', :description => 'The best family in the world', 
:email_address => 'aslakson@gmail.com', :address_1 => '2 Maude Terrace', :city => 'Walpole', 
:state => 'MA', :zip_code => '02081', :telephone => '508-668-6707'
puts 'New organization created: ' << aslaksons.name

jasonsHouse = Location.create! :name => 'Jason\'s house', :description => 'Tiny soccer field in the back yard', 
:address_1 => '2 maude terrace', :city => 'Walpole', :state => 'MA', 
:zip_code => '02081', :telephone => '508-668-6707', :organization_id => aslaksons.id
puts 'New location created: ' << jasonsHouse.name

backyard = Venue.create! :name => 'Backyard Soccer Field', :description => 'A tiny field with tiny little nets', 
:url => 'http://unfamiliarterritory.net', :email_address => 'jason@unfamiliarterritory.net', :location_id => jasonsHouse.id
puts 'New venue created: ' << backyard.name

soccer = Activity.create! :name => 'Soccer', :description => 'Most people call it football'
puts 'New activity created: ' << soccer.name

ref = Service.create! :name => 'Referree', :description => 'The guy with the whistle and funny hat'
puts 'New service created: ' << ref.name

wifi = Ammenity.create! :name => 'Free WiFi', :description => 'Something to keep the kiddies happy during the game.'
puts 'New ammenity created: ' << wifi.name

sixVsix = Facet.create! :name => '6v6 Soccer', :description => 'This soccer field is equipped for 6v6 play', :activity_id => soccer.id
grass = Facet.create! :name => 'Grass Field', :description => 'Natural grass surface', :activity_id => soccer.id
turf = Facet.create! :name => 'Artificial Grass', :description => 'Artificial grass that feels like the real thing', :activity_id => soccer.id

walpoleSoccer.activities << soccer
walpoleSoccer.services << ref
walpoleSoccer.ammenities << wifi
walpoleSoccer.facets << sixVsix
walpoleSoccer.facets << turf
walpoleSoccer.save!

backyard.activities << soccer
backyard.ammenities << wifi
backyard.facets << sixVsix
backyard.facets << grass
backyard.save!