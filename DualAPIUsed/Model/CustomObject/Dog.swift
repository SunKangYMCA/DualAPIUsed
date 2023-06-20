//
//  Dog.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

struct Dog: Codable, Identifiable {
    var id: String
    var url: String
    
    var dogPicture: URL? {
        URL(string: url)
    }
}
