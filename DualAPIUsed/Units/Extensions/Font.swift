//
//  Font.swift
//  DualAPIUsed
//
//  Created by 강성찬 on 2023-05-11.
//

import SwiftUI

extension Font {
    enum SKFontType {
        case tiny, small, normal, large, huge
        case tinyBold, smallBold, normalBold, largeBold, hugeBold
        
        var size: CGFloat {
            switch self {
            case .tiny, .tinyBold:
                return 12
            case .small, .smallBold:
                return 18
            case .normal, .normalBold:
                return 32
            case .large, .largeBold:
                return 48
            case .huge, .hugeBold:
                return 64
            }
        }
        
        var weight: Weight {
            switch self {
            case .tiny, .small, .normal, .large, .huge:
                return .regular
            case .tinyBold, .smallBold, .normalBold, .largeBold, .hugeBold:
                return .bold
            }
        }
    }
    static func skFont(type: Font.SKFontType = .normal) -> Font {
        .system(size: type.size, weight: type.weight)
    }
}
