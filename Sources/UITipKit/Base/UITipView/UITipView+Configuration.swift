//
//  UITipView+Configuration.swift
//
//
//  Created by Seb Vidal on 21/09/2023.
//

import UIKit

extension UITipView {
    public struct Configuration {
        // MARK: - Public Properties
        public var image: UIImage? = nil
        
        public var title: String? = nil
        
        public var message: String? = nil
        
        public var actions: [UIAction] = []
        
        // MARK: - init()
        public init() {}
    }
}
