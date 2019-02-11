//
//  Identity.swift
//  Token
//
//  Created by David Lively on 2/8/19.
//  Copyright © 2019 David Lively. All rights reserved.
//

import Foundation

enum Sex: String {
    case male = "Male"
    case female = "Female"
    case other = "Other"
}

struct Identity {
    let firstName: String
    let lastName: String
    let middleName: String
    let birthDate: Date
    let sex: Sex
    let age: Int
    let uuid: UUID

    var address: Address?
    var photoPath: String?
    var email: String?
    
    init(firstName: String, middleName: String = "", lastName: String, birthDate: Date, sex: Sex) {
        self.firstName = firstName
        self.lastName = lastName
        self.middleName = middleName
        self.birthDate = birthDate
        self.sex = sex
        age = Calendar.current.dateComponents([.year], from: birthDate, to: Date()).year ?? 0
        uuid = UUID()
    }
}

extension Identity {
    static let moc: Identity = {
        let first = "John"
        let middle = "Alan"
        let last = "Smith"
        let calendar = Calendar.current
        var dateComponents = DateComponents()
        dateComponents.year = 1992
        dateComponents.month = 1
        dateComponents.day = 1
        let birthday = calendar.date(from: dateComponents) ?? Date()
        let identity = Identity(firstName: first, middleName: middle, lastName: last, birthDate: birthday, sex: .male)
        return identity
    }()
}
