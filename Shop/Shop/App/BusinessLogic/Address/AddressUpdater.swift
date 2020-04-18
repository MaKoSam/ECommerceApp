//
//  AddressUpdater.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AddressUpdater: NSObject {
    func setCountryValue(country: String, forAdress address:Address) -> Address{
        address.country = country
        return address
    }
    
    func setCityValue(city: String, forAdress address:Address) -> Address{
        address.city = city
        return address
    }
    
    func setLine1Value(line: String, forAdress address:Address) -> Address{
        address.line1 = line
        return address
    }
    
    func setLine2Value(line: String, forAdress address:Address) -> Address{
        address.line2 = line
        return address
    }
    
    func setHouseValue(house: String, forAdress address:Address) -> Address{
        address.house = house
        return address
    }
    
    func setApartmentValue(apartment: String, forAdress address:Address) -> Address{
        address.apartment = apartment
        return address
    }

}
