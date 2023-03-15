//
//  UserModel.swift
//  ServixApp
//
//  Created by alumnos on 6/3/23.
//

import Foundation

struct UserModel: Codable{
    
    var username: String
    var email: String
    var password: String
    var repeatPass: String
    var phoneNumber: String
    
}
