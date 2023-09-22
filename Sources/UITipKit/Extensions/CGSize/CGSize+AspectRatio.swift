//
//  CGSize+AspectRatio.swift
//
//
//  Created by Seb Vidal on 22/09/2023.
//

import Foundation

extension CGSize {
    var aspectRatio: CGFloat {
        return width / height
    }
}
