//
//  UITipView+Configuration.swift
//
//
//  Created by Seb Vidal on 21/09/2023.
//

import UIKit

public extension UITipView {
    struct Configuration {
        // MARK: - Public Properties
        public var image: UIImage?

        public var title: String?

        public var message: String?

        public var actions: [UIAction] = []

        public var background: Background = .init()

        // MARK: - init()
        public init() {}
    }
}
