module RandomData
  
  # Defines methods to return random location data.
  
  module Locations

    
    trees = %w( Acacia Beech Birch Cedar Cherry Chestnut Elm Larch Laurel
                Linden Maple Oak Pine Rose Walnut Willow)
    people = %w( Adams Franklin Jackson Jefferson Lincoln
                  Madison Washington Wilson)
    people_uk = %w( Churchill Tyndale Latimer Cranmer )
    places = %w( Highland Hill Park Woodland Sunset Virginia)
    numbers = %w( 1st 2nd 4th 5th 34th 42nd )
    @@streetnames =  trees + people + places + numbers
                    
    @@street_types = %w(St Ave Rd Blvd Trl Ter Rdg Pl Pkwy Ct Circle)

    # Returns the first line of a US maiiling address (street number, street name, street type)
    #
    # Example:
    #
    #Random.address_line_1 = "24317 Jefferson Blvd"
    
    def address_line_1
      "#{rand(40000)} #{@@streetnames.rand} #{@@street_types.rand}"
    end

    alias :us_address_line_1 :address_line_1

    @@line2types = ["Apt", "Bsmt", "Bldg", "Dept", "Fl", "Frnt", "Hngr", "Lbby", "Lot", "Lowr", "Ofc", "Ph", "Pier", "Rear", "Rm", "Side", "Slip", "Spc", "Stop", "Ste", "Trlr", "Unit", "Uppr"]

    # Returns the first line of a US maiiling address (street number, street name, street type)
    #
    # Example:
    #
    #Random.address_line_1 = "24317 Jefferson Blvd"
    
    def address_line_2
      "#{@@line2types.rand} #{rand(999)}"    
    end

    # Returns a random 5-digit string, not guaranteed to be a legitimate zip code.
    # Legal zip codes can have leading zeroes and thus they need to be strings.  
    
    def zipcode
     "%05d" % rand(99999) 
    end


    # Returns a string providing something in the general form of a UK post code.  Like the zip codes, this might
    # not actually be valid. Doesn't cover London whose codes are like "SE1".

    def uk_post_code
      post_towns = %w(BM CB CV LE LI LS KT MK NE OX PL YO)
      # Can't remember any othes at the moment
      number_1  = rand(100).to_s
      number_2  = rand(100).to_s
      # Easier way to do this? 
      letters = ("AA".."ZZ").to_a.rand

      return "#{post_towns.rand}#{number_1} #{number_2}#{letters}"
    end

    # from technoweenie: http://svn.techno-weenie.net/projects/plugins/us_states/lib/us_states.rb
    @@us_states = [["Alaska", "AK"], ["Alabama", "AL"], ["Arkansas", "AR"], ["Arizona", "AZ"], 
                   ["California", "CA"], ["Colorado", "CO"], ["Connecticut", "CT"], ["District of Columbia", "DC"], 
                   ["Delaware", "DE"], ["Florida", "FL"], ["Georgia", "GA"], ["Hawaii", "HI"], ["Iowa", "IA"], 
                   ["Idaho", "ID"], ["Illinois", "IL"], ["Indiana", "IN"], ["Kansas", "KS"], ["Kentucky", "KY"], 
                   ["Louisiana", "LA"], ["Massachusetts", "MA"], ["Maryland", "MD"], ["Maine", "ME"], ["Michigan", "MI"], 
                   ["Minnesota", "MN"], ["Missouri", "MO"], ["Mississippi", "MS"], ["Montana", "MT"], ["North Carolina", "NC"], 
                   ["North Dakota", "ND"], ["Nebraska", "NE"], ["New Hampshire", "NH"], ["New Jersey", "NJ"], 
                   ["New Mexico", "NM"], ["Nevada", "NV"], ["New York", "NY"], ["Ohio", "OH"], ["Oklahoma", "OK"], 
                   ["Oregon", "OR"], ["Pennsylvania", "PA"], ["Rhode Island", "RI"], ["South Carolina", "SC"], ["South Dakota", "SD"], 
                   ["Tennessee", "TN"], ["Texas", "TX"], ["Utah", "UT"], ["Virginia", "VA"], ["Vermont", "VT"], 
                   ["Washington", "WA"], ["Wisconsin", "WI"], ["West Virginia", "WV"], ["Wyoming", "WY"]]                    

    # Returns a state 2-character abbreviation
    # Random.state = "IL"
    
    def state
      @@us_states.rand[1]
    end

    # Returns a full state name
    #Random.state_full = "Texas"

    def state_full
      @@us_states.rand[0]   
    end

    # from http://siteresources.worldbank.org/DATASTATISTICS/Resources/CLASS.XLS
    @@countries = ["Afghanistan", "Albania", "Algeria", "American Samoa", "Andorra", "Angola", "Antigua and Barbuda", "Argentina", "Armenia", "Aruba", "Australia", 
                  "Austria", "Azerbaijan", "Bahamas, The", "Bahrain", "Bangladesh", "Barbados", "Belarus", "Belgium", "Belize", "Benin", "Bermuda", "Bhutan", 
                  "Bolivia", "Bosnia and Herzegovina", "Botswana", "Brazil", "Brunei Darussalam", "Bulgaria", "Burkina Faso", "Burundi", "Cambodia", "Cameroon", 
                  "Canada", "Cape Verde", "Cayman Islands", "Central African Republic", "Chad", "Channel Islands", "Chile", "China", "Colombia", "Comoros", "Congo, Dem. Rep.", 
                  "Congo, Rep.", "Costa Rica", "Côte d'Ivoire", "Croatia", "Cuba", "Cyprus", "Czech Republic", "Denmark", "Djibouti", "Dominica", "Dominican Republic", "Ecuador", 
                  "Egypt, Arab Rep.", "El Salvador", "Equatorial Guinea", "Eritrea", "Estonia", "Ethiopia", "Faeroe Islands", "Fiji", "Finland", "France", "French Polynesia", 
                  "Gabon", "Gambia, The", "Georgia", "Germany", "Ghana", "Greece", "Greenland", "Grenada", "Guam", "Guatemala", "Guinea", "Guinea-Bissau", "Guyana", "Haiti", 
                  "Honduras", "Hong Kong, China", "Hungary", "Iceland", "India", "Indonesia", "Iran, Islamic Rep.", "Iraq", "Ireland", "Isle of Man", "Israel", "Italy", "Jamaica", 
                  "Japan", "Jordan", "Kazakhstan", "Kenya", "Kiribati", "Korea, Dem. Rep.", "Korea, Rep.", "Kuwait", "Kyrgyz Republic", "Lao PDR", "Latvia", "Lebanon", "Lesotho", 
                  "Liberia", "Libya", "Liechtenstein", "Lithuania", "Luxembourg", "Macao, China", "Macedonia, FYR", "Madagascar", "Malawi", "Malaysia", "Maldives", "Mali", "Malta", 
                  "Marshall Islands", "Mauritania", "Mauritius", "Mayotte", "Mexico", "Micronesia, Fed. Sts.", "Moldova", "Monaco", "Mongolia", "Montenegro", "Morocco", 
                  "Mozambique", "Myanmar", "Namibia", "Nepal", "Netherlands", "Netherlands Antilles", "New Caledonia", "New Zealand", "Nicaragua", "Niger", "Nigeria", 
                  "Northern Mariana Islands", "Norway", "Oman", "Pakistan", "Palau", "Panama", "Papua New Guinea", "Paraguay", "Peru", "Philippines", "Poland", "Portugal",
                  "Puerto Rico", "Qatar", "Romania", "Russian Federation", "Rwanda", "Samoa", "San Marino", "São Tomé and Principe", "Saudi Arabia", "Senegal", "Serbia", 
                  "Seychelles", "Sierra Leone", "Singapore", "Slovak Republic", "Slovenia", "Solomon Islands", "Somalia", "South Africa", "Spain", "Sri Lanka", "St. Kitts and Nevis", 
                  "St. Lucia", "St. Vincent and the Grenadines", "Sudan", "Suriname", "Swaziland", "Sweden", "Switzerland", "Syrian Arab Republic", "Tajikistan", "Tanzania", "Thailand", 
                  "Timor-Leste", "Togo", "Tonga", "Trinidad and Tobago", "Tunisia", "Turkey", "Turkmenistan", "Uganda", "Ukraine", "United Arab Emirates", "United Kingdom", 
                  "United States", "Uruguay", "Uzbekistan", "Vanuatu", "Venezuela, RB", "Vietnam", "Virgin Islands (U.S.)", "West Bank and Gaza", "Yemen, Rep.", "Zambia", "Zimbabwe"]

    # Returns a country name, as listed by the World Bank
    #
    #Random.country = "Kenya"
    
    def country
      @@countries.rand
    end

    @@cities = %w(Midway Mount\ Pleasant Greenwood Franklin Oak Grove Centerville Salem Georgetown Fairview Riverside Rotorua Tauranga Whakatane Taupo Wanganui 
                  Nababeep Aggeneys Pofadder Polokwane Bela Bela Goukamma Karatara Tswane Prieska Upington Hoopstad Bultfontein Wesselsbron Bothaville Trompsburg 
                  Henneman Musina Ogies Kgatlahong Tembisa Tekoza Sebokeng Muntaung Umnkomaaz)

    # Returns a generic city name, with an attempt to have some internationl appeal
    #
    # Random.city = "Tekoza"
     
    def city
      @@cities.rand
    end
  end
end
