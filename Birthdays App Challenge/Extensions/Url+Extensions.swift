//
//  Url+Extensions.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import Foundation


extension URL {
    static func fetchBirthdays() -> URL? {
        return URL(string:  "https://randomuser.me/api/?results=1000&seed=chalkboard&inc=name,dob")
    }
}
