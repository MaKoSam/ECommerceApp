//
//  AddressBuilder.swift
//  Shop
//
//  Created by Sam Mazniker on 18/04/2020.
//  Copyright © 2020 Sam Mazniker. All rights reserved.
//

import UIKit

class AddressBuilder: NSObject {
    private var addressUpdater = AddressUpdater()
    
    private func makeAddress() -> Address {
        return Address()
    }
    
    private func passSecurityCheck(address: Address) -> Bool{
        if(address.country != ""){
            if(address.city != ""){
                if(address.line1 != ""){
                    return true
                }
            }
        }
        return false;
    }
    
    func buildDefaultAddress() -> Address?{
        var address = makeAddress()
        address = DefaultAddress()
        if(passSecurityCheck(address: address)){
            return address
        }
        return nil
    }
    
    func buildAddressFromDictionary(dictionary: [String: String]) -> Address?{
        var address = makeAddress()
        
        if let country = dictionary["country"] {
            address = addressUpdater.setCountry(country: country, for: address)
        }
        
        if let city = dictionary["city"] {
            address = addressUpdater.setCity(city: city, for: address)
        }
        
        if let line1 = dictionary["line1"] {
            address = addressUpdater.setLine1(line: line1, for: address)
        }
        
        if let line2 = dictionary["line2"] {
            address = addressUpdater.setLine2(line: line2, for: address)
        }
        
        if let house = dictionary["house"] {
            address = addressUpdater.setHouse(house: house, for: address)
        }
        
        if let apartment = dictionary["apartment"] {
            address = addressUpdater.setApartment(apartment: apartment, for: address)
        }
        
        if(passSecurityCheck(address: address)){
            return address
        }
        return nil
    }

}
