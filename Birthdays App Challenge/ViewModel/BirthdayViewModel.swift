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
        let dobString = birthday.dob.date.components(separatedBy: ".")[0]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        if let date = dateFormatter.date(from: dobString) {
            dateFormatter.dateFormat = "dd-MM-yyyy"
            let formattedDobString = dateFormatter.string(from: date)
            return formattedDobString
        } else {
            return ""
        }
    }


    var age: String {
        String(birthday.dob.age)
    }

}
