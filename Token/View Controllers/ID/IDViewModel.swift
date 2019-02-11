//
//  IDViewModel.swift
//  Token
//
//  Created by David Lively on 2/8/19.
//  Copyright © 2019 David Lively. All rights reserved.
//

import UIKit

struct IDViewModel {
    let identity: Identity
    
    var name: String {
        return "\(identity.firstName) \(identity.middleName) \(identity.lastName)"
    }

    var birthDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: identity.birthDate)
    }
    
    var age: String {
        return String(identity.age)
    }
    
    var uuid: String {
        return identity.uuid.uuidString
    }
    
    var photo: UIImage? {
        guard let path = identity.photoPath else {
            return nil
        }
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            return UIImage(contentsOfFile: path)
        } else {
            return nil
        }
        
    }
}
