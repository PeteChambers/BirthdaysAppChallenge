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

    var fullName: String {
        "\(birthday.name.first) \(birthday.name.last)"
    }

    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
             formatter.style = .abbreviated
             return formatter.string(from: components)
        }
        return ""
    }

    var dateOfBirth: String {
        birthday.dob.date.components(separatedBy: "T")[0]
    }

    var age: String {
        String(birthday.dob.age)
    }

}
