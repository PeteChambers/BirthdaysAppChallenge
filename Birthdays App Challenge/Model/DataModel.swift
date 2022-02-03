//
//  DataModel.swift
//  Birthdays App Challenge
//
//  Created by Pete Chambers on 03/02/2022.
//

import Foundation

// MARK: - Birthdays
struct Birthdays: Codable {
    let results: [BirthdayResult]
    let info: Info
}

// MARK: - Info
struct Info: Codable {
    let seed: String
    let results, page: Int
    let version: String
}

// MARK: - Result
struct BirthdayResult: Codable {
    let name: Name
    let dob: Dob
}

// MARK: - Dob
struct Dob: Codable {
    let date: String
    let age: Int
}

// MARK: - Name
struct Name: Codable {
    let title: Title
    let first, last: String
}

enum Title: String, Codable {
    case madame = "Madame"
    case mademoiselle = "Mademoiselle"
    case miss = "Miss"
    case monsieur = "Monsieur"
    case mr = "Mr"
    case mrs = "Mrs"
    case ms = "Ms"
}
