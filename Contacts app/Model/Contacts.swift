//
//  Contacts.swift
//  Contacts app
//
//  Created by Prabal Kumar on 08/09/24.
//

import Foundation

struct Contact: Identifiable, Codable {
    var id = UUID()
    var name: String
    var phoneNumber: String
}
