//
//  AddressUpdater.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AddressUpdater: NSObject {
    func setCountry(country: String, for address:Address) -> Address{
        address.country = country
        return address
    }
    
    func setCity(city: String, for address:Address) -> Address{
        address.city = city
        return address
    }
    
    func setLine1(line: String, for address:Address) -> Address{
        address.line1 = line
        return address
    }
    
    func setLine2(line: String, for address:Address) -> Address{
        address.line2 = line
        return address
    }
    
    func setHouse(house: String, for address:Address) -> Address{
        address.house = house
        return address
    }
    
    func setApartment(apartment: String, for address:Address) -> Address{
        address.apartment = apartment
        return address
    }

}
