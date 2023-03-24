//
//  UserModel.swift
//  BaseMVVM-CTestable
//
//  Created by Junior Margalho on 24/03/23.
//

import Foundation

public struct UserModel: Decodable {
    let id: Int
    let avatar: String
    let email: String?
    let firstName: String?
    let lastName: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case email
        case firstName = "first_name"
        case lastName = "last_name"
        case avatar
    }
}
