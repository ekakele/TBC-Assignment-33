//
//  ContentSizeCategoryExtension.swift
//  Assignment-33
//
//  Created by Eka Kelenjeridze on 28.12.23.
//

import SwiftUI

extension ContentSizeCategory {
    var customMinScaleFactor: CGFloat {
        switch self {
        case .extraSmall, .small, .medium:
            return 1.0
        case .large, .extraLarge, .extraExtraExtraLarge:
            return 0.8
        default:
            return 0.6
        }
    }
}
