//
//  UITipView+Background.swift
//
//
//  Created by Seb Vidal on 22/09/2023.
//

import UIKit

public extension UITipView.Configuration {
    struct Background {
        // MARK: - Public Properties
        public var backgroundColor: UIColor = .secondarySystemBackground

        public var cornerRadius: CGFloat = 12
        
        // MARK: - init()
        internal init() {}
    }
}
