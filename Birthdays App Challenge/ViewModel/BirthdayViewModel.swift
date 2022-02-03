//
//  BirthdayViewModel.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import Foundation

struct BirthdayViewModel {
    private let birthday: BirthdayResult
}

extension BirthdayViewModel {
    init(_ birthday: BirthdayResult) {
        self.birthday = birthday
    }
}

extension BirthdayViewModel {

    var title: String {
        birthday.name.title.rawValue
    }

    var firstName: String {
        birthday.name.first
    }

    var lastName: String {
        birthday.name.last
    }

}
