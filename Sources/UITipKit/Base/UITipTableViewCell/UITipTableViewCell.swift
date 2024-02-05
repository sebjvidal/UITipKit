//
//  UITipTableViewCell.swift
//
//
//  Created by Seb Vidal on 23/12/2023.
//

import UIKit

public class UITipTableViewCell: UITableViewCell {
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
    
    // MARK: - init(style:reuseIdentifier:)
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupTableViewCell()
        setupTipView()
    }
    
    // MARK: - init(coder:)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupTableViewCell() {
        selectionStyle = .none
        backgroundColor = .clear
    }
    
    private func setupTipView() {
        tipView = UITipView()
        tipView.configuration = UITipView.Configuration()
        tipView.configuration?.background.cornerRadius = 0
        tipView.configuration?.background.backgroundColor = .clear
        tipView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(tipView)
        
        NSLayoutConstraint.activate([
            tipView.topAnchor.constraint(equalTo: contentView.topAnchor),
            tipView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tipView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tipView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
    
    // MARK: - layoutSubviews()
    public override func layoutSubviews() {
        super.layoutSubviews()
        contentView.invalidateIntrinsicContentSize()
    }
}
