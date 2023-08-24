//
//  SingUpModel.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 20.08.2023.
//

import Foundation

struct RegisterInfo: Codable {
    var full_name: String
    var email: String
    var password: String
}

struct RegisterReturn: Codable {
    var message: String
    var status: String
}
