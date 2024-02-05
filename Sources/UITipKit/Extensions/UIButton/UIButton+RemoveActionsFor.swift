//
//  UIButton+RemoveActionsFor.swift
//  
//
//  Created by Seb Vidal on 05/02/2024.
//

import UIKit

extension UIButton {
    func removeActions(for event: UIControl.Event) {
        enumerateEventHandlers { action, _, controlEvent, _ in
            guard let action, event == controlEvent else { return }
            removeAction(action, for: event)
        }
    }
}
