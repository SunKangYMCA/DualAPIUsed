//
//  Cat.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

struct Cat: Codable, Identifiable {
    
    var id: String
    var url: String
    
    var catPicture: URL? {
        URL(string: url)
    }
}
