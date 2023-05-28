//
//  Quote.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-26.
//

import SwiftUI

struct Quote: Codable {
    var quote_id: Int
    var quote: String
    var author: String
    var serise: String
}
