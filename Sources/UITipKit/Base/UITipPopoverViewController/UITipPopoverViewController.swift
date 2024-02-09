//
//  UITipPopoverViewController.swift
//
//
//  Created by Seb Vidal on 09/02/2024.
//

import UIKit

public class UITipPopoverViewController: UIViewController, UIPopoverPresentationControllerDelegate {
    // MARK: - Private Properties
    private var tipView: UITipView!
    
    // MARK: - Public Properties
    public var configuration: UITipView.Configuration? {
        get {
            return tipView.configuration
        } set {
            tipView.configuration = newValue
            updatePreferredContentSize()
        }
    }
    
    public override var popoverPresentationController: UIPopoverPresentationController {
        return super.popoverPresentationController!
    }
    
    // MARK: - init(nibName:bundle:)
    public override init(nibName: String?, bundle: Bundle?) {
        super.init(nibName: nibName, bundle: bundle)
        setupViewController()
        setupTipView()
    }
    
    // MARK: - init(coder:)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupViewController() {
        modalPresentationStyle = .popover
        popoverPresentationController.delegate = self
    }
    
    private func setupTipView() {
        tipView = UITipView()
        tipView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(tipView)
        
        NSLayoutConstraint.activate([
            tipView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tipView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tipView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tipView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    private func updatePreferredContentSize() {
        preferredContentSize.height = tipView.intrinsicContentSize.height
    }
    
    // MARK: - viewDidLayoutSubviews()
    public override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updatePreferredContentSize()
    }
    
    // MARK: - UIPopoverPresentationControllerDelegate
    public func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    public func popoverPresentationControllerShouldDismissPopover(_ popoverPresentationController: UIPopoverPresentationController) -> Bool {
        return !isModalInPresentation
    }
}
