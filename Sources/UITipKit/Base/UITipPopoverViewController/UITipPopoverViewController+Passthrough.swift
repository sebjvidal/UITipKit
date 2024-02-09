//
//  UITipPopoverViewController+Passthrough.swift
//
//
//  Created by Seb Vidal on 09/02/2024.
//

import UIKit

public extension UITipPopoverViewController {
    var delegate: UIPopoverPresentationControllerDelegate? {
        get {
            return popoverPresentationController.delegate
        } set {
            popoverPresentationController.delegate = newValue
        }
    }
    
    var permittedArrowDirections: UIPopoverArrowDirection {
        get {
            return popoverPresentationController.permittedArrowDirections
        } set {
            popoverPresentationController.permittedArrowDirections = newValue
        }
    }
    
    var sourceView: UIView? {
        get {
            return popoverPresentationController.sourceView
        } set {
            popoverPresentationController.sourceView = newValue
        }
    }
    
    var sourceRect: CGRect {
        get {
            return popoverPresentationController.sourceRect
        } set {
            popoverPresentationController.sourceRect = newValue
        }
    }
    
    var canOverlapSourceViewRect: Bool {
        get {
            return popoverPresentationController.canOverlapSourceViewRect
        } set {
            popoverPresentationController.canOverlapSourceViewRect = newValue
        }
    }
    
    @available(iOS 16.0, *)
    var sourceItem: UIPopoverPresentationControllerSourceItem? {
        get {
            return popoverPresentationController.sourceItem
        } set {
            popoverPresentationController.sourceItem = newValue
        }
    }
    
    var arrowDirection: UIPopoverArrowDirection {
        return popoverPresentationController.arrowDirection
    }
    
    var passthroughViews: [UIView]? {
        get {
            return popoverPresentationController.passthroughViews
        } set {
            popoverPresentationController.passthroughViews = newValue
        }
    }
    
    var backgroundColor: UIColor? {
        get {
            return popoverPresentationController.backgroundColor
        } set {
            popoverPresentationController.backgroundColor = newValue
        }
    }
    
    var popoverLayoutMargins: UIEdgeInsets {
        get {
            return popoverPresentationController.popoverLayoutMargins
        } set {
            popoverPresentationController.popoverLayoutMargins = newValue
        }
    }
    
    var popoverBackgroundViewClass: UIPopoverBackgroundViewMethods.Type? {
        get {
            return popoverPresentationController.popoverBackgroundViewClass
        } set {
            popoverPresentationController.popoverBackgroundViewClass = newValue
        }
    }
}
