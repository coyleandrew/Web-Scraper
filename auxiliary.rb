
module Location

    def retrieve_add(locationName)
        # given the name of a dining location, returns its address
        case locationName
        when "12th Avenue Bread Co."
            "251 W. 12th Ave, Columbus, OH"
        when "Cafe Operations -  Berry Cafe"
            "1858 Neil Ave, Columbus, OH"
        when "Cafe Operations -  Caffeine Element"
            "376 W. 10th Avenue, Columbus, OH"
        when "Cafe Operations -  Cafe CFAES"
            "2120 Fyffe Road, Columbus, OH"
        when "Connecting Grounds"
            "160 West Woodruff Ave, Columbus, OH"
        when "Courtside Cafe & Juice 2 -  Courtside Cafe"
            "337 Annie and John Glenn Ave, Columbus, OH"
        when "Cafe Operations -  Crane Cafe"
            "1775 College Rd, Columbus, OH"
        when "Curl Market"
            "80 W. Woodruff Ave, Columbus, OH"
        when "Ohio Union Operations -  Espress-OH"
            "1739 North High Street, Columbus, OH"
        when "Courtside Cafe & Juice 2 -  Juice 2"
            "337 Annie and John Glenn Ave, Columbus, OH"
        when "Cafe Operations -  KSA Cafe"
            "275 West Woodruff Avenue, Columbus, OH"
        when "The MarketPlace on Neil -  The MarketPlace"
            "1578 Neil Avenue, Columbus, OH"
        when "Mirror Lake Eatery"
            "1760 Neil Avenue, Columbus, OH"
        when "Oxley's By The Numbers"
            "2050 Tuttle Park Place, Columbus, OH"
        when "Oxley's To Go"
            "2050 Tuttle Park Place, Columbus, OH"
        when "Ohio Union Operations -  Sloopy's Diner"
            "1739 North High Street, Columbus, OH"
        when "The MarketPlace on Neil -  Street Sweets"
            "1578 Neil Avenue, Columbus, OH"
        when "Cafe Operations -  Terra Byte Cafe"
            "175 W. 18th Avenue, Columbus, OH"
        when "Cafe Operations -  C-Grinds - McPherson"
            "140 W. 18th Avenue, Columbus, OH"
        when "Cafe Operations -  C-Grinds - Vet Med"
            "1900 Coffey Road, Columbus, OH"
        when "The PAD"
            "328 W. Lane Avenue, Columbus, OH"
        when "Kennedy Traditions"
            "251 W. 12th Avenue, Columbus, OH"
        when "Morrill Traditions"
            "1900 Cannon Drive, Columbus, OH"
        when "Scott Traditions"
            "Scott House 160 W. Woodruff Avenue, Columbus, OH"
        when "Ohio Union Operations -  Union Market"
            "1739 North High Street, Columbus, OH"
        when "Ohio Union Operations -  Woody's Tavern"
            "1739 North High Street, Columbus, OH"
        when "Foodtruck 1.0"
            "1958 Neil Ave, Columbus, OH"
        when "Foodtruck 2.0"
            "1958 Neil Ave, Columbus, OH"
        when "Newark"
            "1179 University Dr, Newark, OH"
        when "Mansfield"
            "1760 University Dr, Mansfield, OH"
        when "Wooster"
            "1889 Garrison Cir E Wooster, OH"
        when "Moco Fusion"
            "1900 Cannon Drive Columbus, OH"
        else
            # an invalid location was passed
            raise "Invalid location"
        end
    end
end