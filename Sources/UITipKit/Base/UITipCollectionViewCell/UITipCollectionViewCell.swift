//
//  UITipCollectionViewCell.swift
//
//
//  Created by Seb Vidal on 22/03/2024.
//

import UIKit

public class UITipCollectionViewCell: UICollectionViewCell {
    // MARK: - Private Properties
    private var tipView: UITipView!
    
    // MARK: - Public Properties
    public var configuration: UITipView.Configuration? {
        get {
            return tipView.configuration
        } set {
            tipView.configuration = newValue
            contentView.invalidateIntrinsicContentSize()
        }
    }
    
    public override var layoutMargins: UIEdgeInsets {
        get {
            return contentView.layoutMargins
        } set {
            contentView.layoutMargins = newValue
        }
    }
    
    // MARK: - init(frame:)
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setupCollectionViewCell()
        setupTipView()
    }
    
    // MARK: - init(configuration:)
    convenience init(configuration: UITipView.Configuration) {
        self.init(frame: .zero)
        self.configuration = configuration
    }
    
    // MARK: - init(coder:)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupCollectionViewCell() {
        backgroundColor = .clear
        layoutMargins = .zero
    }
    
    private func setupTipView() {
        tipView = UITipView()
        tipView.configuration = UITipView.Configuration()
        tipView.configuration?.background.cornerRadius = 0
        tipView.configuration?.background.backgroundColor = .clear
        tipView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(tipView)
        
        NSLayoutConstraint.activate([
            tipView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
            tipView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
            tipView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
            tipView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor)
        ])
    }
    
    // MARK: - layoutSubviews()
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.invalidateIntrinsicContentSize()
    }
}
