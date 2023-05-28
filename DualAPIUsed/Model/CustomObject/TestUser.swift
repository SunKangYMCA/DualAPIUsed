//
//  TestUser.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-26.
//

import SwiftUI

struct TestUser: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
    let company: Company
}

struct Company: Codable {
    let name: String
}
    
