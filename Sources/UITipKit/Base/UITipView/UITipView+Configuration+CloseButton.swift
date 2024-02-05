//
//  UITipView+Configuration+CloseButton.swift
//
//
//  Created by Seb Vidal on 05/02/2024.
//

import UIKit

public extension UITipView.Configuration {
    struct CloseButton {
        // MARK: - Public Properties
        public var isHidden: Bool = false
        
        public var action: UIAction? = nil
        
        // MARK: - init()
        internal init() {}
    }
}
