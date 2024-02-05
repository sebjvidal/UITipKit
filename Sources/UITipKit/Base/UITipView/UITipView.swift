//
//  UITipView.swift
//
//
//  Created by Seb Vidal on 21/09/2023.
//

import UIKit

public class UITipView: UIView {
    // MARK: - Private Properties
    private var contentView: UIView!
    private var closeButton: UIButton!
    private var imageView: UIImageView!
    private var titleLabel: UILabel!
    private var messageLabel: UILabel!
    private var actionButtons: [UIButton] = []
    private var separatorViews: [UIView] = []
    
    // MARK: - Public Properties
    public var configuration: UITipView.Configuration? = nil {
        didSet { updateUI(for: configuration) }
    }
    
    override public var intrinsicContentSize: CGSize {
        return calculateIntrinsicContentSize()
    }
    
    // MARK: - init(frame:)
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
        setupCloseButton()
        setupImageView()
        setupTitleLabel()
        setupMessageLabel()
    }
    
    // MARK: - init(configuration:)
    public convenience init(configuration: Configuration) {
        self.init(frame: .zero)
        self.configuration = configuration
    }
    
    // MARK: - init?(coder:)
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupContentView() {
        contentView = UIView()
        contentView.clipsToBounds = true
        contentView.layer.cornerRadius = 12
        contentView.layer.cornerCurve = .continuous
        contentView.backgroundColor = .secondarySystemBackground
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(contentView)
        
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: topAnchor),
            contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    private func setupCloseButton() {
        let sizeConfig = UIImage.SymbolConfiguration(textStyle: .footnote)
        let weightConfig = UIImage.SymbolConfiguration(weight: .bold)
        
        let image = UIImage(systemName: "xmark")?
            .applyingSymbolConfiguration(sizeConfig)?
            .applyingSymbolConfiguration(weightConfig)
        
        closeButton = UIButton(type: .system)
        closeButton.tintColor = .quaternaryLabel
        closeButton.setImage(image, for: .normal)
        
        contentView.addSubview(closeButton)
    }
    
    private func setupImageView() {
        imageView = UIImageView()
        imageView.tintColor = .tintColor
        imageView.contentMode = .scaleAspectFit
        
        contentView.addSubview(imageView)
    }
    
    private func setupTitleLabel() {
        titleLabel = UILabel()
        titleLabel.numberOfLines = 0
        titleLabel.font = .preferredFont(forTextStyle: .headline)
        
        contentView.addSubview(titleLabel)
    }
    
    private func setupMessageLabel() {
        messageLabel = UILabel()
        messageLabel.numberOfLines = 0
        messageLabel.textColor = .secondaryLabel
        messageLabel.font = .preferredFont(forTextStyle: .subheadline)
        
        contentView.addSubview(messageLabel)
    }
    
    private func setupActionsButtons(for actions: [UIAction]?) {
        actionButtons.forEach { $0.removeFromSuperview() }
        actionButtons.removeAll()
        
        actions?.compactMap { $0 }.forEach { action in
            let actionButton = UIButton(type: .system)
            actionButton.setTitle(action.title, for: .normal)
            actionButton.setTitleColor(.tintColor, for: .normal)
            actionButton.addAction(action, for: .touchUpInside)
            actionButton.contentHorizontalAlignment = .leading
            actionButton.titleLabel?.font = .preferredFont(forTextStyle: .body)
            
            actionButtons.append(actionButton)
            contentView.addSubview(actionButton)
        }
    }
    
    private func setupSeparatorViews(for actionButtons: [UIButton]) {
        actionButtons.forEach { _ in
            let separatorView = UIView()
            separatorView.backgroundColor = .separator
            
            separatorViews.append(separatorView)
            contentView.addSubview(separatorView)
        }
    }
    
    private func updateUI(for configuration: UITipView.Configuration?) {
        closeButton.isHidden = configuration?.closeButton.isHidden == true
        imageView.image = configuration?.image
        imageView.tintColor = configuration?.imageProperties.tintColor
        titleLabel.text = configuration?.title
        messageLabel.text = configuration?.message
        setupActionsButtons(for: configuration?.actions)
        setupSeparatorViews(for: actionButtons)
        
        contentView.backgroundColor = configuration?.background.backgroundColor ?? .secondarySystemBackground
        contentView.layer.cornerRadius = configuration?.background.cornerRadius ?? 12
        
        layoutSubviews()
    }
    
    private func calculateIntrinsicContentSize() -> CGSize {
        let subviews = contentView.subviews.sorted { lhs, rhs in
            return lhs.frame.maxY > rhs.frame.maxY
        }
        
        let width = window?.frame.width ?? -1
        var height: CGFloat = subviews[0].frame.maxY
        
        switch subviews[0] {
        case imageView:
            height += 14
        case titleLabel:
            height += 16
        case closeButton:
            height += 15
        case messageLabel:
            height += 16
        default:
            height += 2
        }
        
        return CGSize(width: width, height: height)
    }
    
    // MARK: - layoutSubviews()
    override public func layoutSubviews() {
        super.layoutSubviews()
        layoutCloseButton()
        layoutImageView()
        layoutTitleLabel()
        layoutMessageLabel()
        layoutActionButtons()
        layoutSeparatorViews()
        invalidateIntrinsicContentSize()
    }
    
    private func layoutCloseButton() {
        let size = closeButton.sizeThatFits(frame.size)
        let x = frame.width - size.width - 13
        let y: CGFloat = 15
        
        closeButton.frame.size = size
        closeButton.frame.origin = CGPoint(x: x, y: y)
    }
    
    private func layoutImageView() {
        if let image = imageView.image {
            let x: CGFloat = 9
            let y: CGFloat = 15
            let width: CGFloat = 52.333
            let height = min(50, width / image.size.aspectRatio)
            imageView.frame = CGRect(x: x, y: y, width: width, height: height)
        } else {
            imageView.frame = CGRect.zero
        }
    }
    
    private func layoutTitleLabel() {
        if let _ = imageView.image {
            let maxWidth = frame.width - imageView.frame.maxX - closeButton.frame.width - 28
            let maxSize = CGSize(width: maxWidth, height: frame.height)
            titleLabel.frame.size = titleLabel.sizeThatFits(maxSize)
            
            let x: CGFloat = imageView.frame.maxX + 8
            let y: CGFloat = imageView.frame.minY - 1
            titleLabel.frame.origin = CGPoint(x: x, y: y)
        } else {
            let maxWidth = frame.width - closeButton.frame.width - 28
            let maxSize = CGSize(width: maxWidth, height: frame.height)
            titleLabel.frame.size = titleLabel.sizeThatFits(maxSize)
            
            let x: CGFloat = 13
            let y: CGFloat = 14
            titleLabel.frame.origin = CGPoint(x: x, y: y)
        }
    }
    
    private func layoutMessageLabel() {
        if let _ = configuration?.message {
            let maxWidth = frame.width - titleLabel.frame.minX - 12
            let maxSize = CGSize(width: maxWidth, height: frame.height)
            messageLabel.frame.size = messageLabel.sizeThatFits(maxSize)
            
            let x: CGFloat = titleLabel.frame.origin.x
            let y: CGFloat = titleLabel.frame.maxY + 4
            messageLabel.frame.origin = CGPoint(x: x, y: y)
        } else {
            messageLabel.frame = .zero
        }
    }
    
    private func layoutActionButtons() {
        let maxWidth = frame.width - titleLabel.frame.origin.x
        let maxSize = CGSize(width: maxWidth, height: frame.height)
        
        let x = titleLabel.frame.origin.x
        let minY = messageLabel.frame.maxY + 9
        
        for (index, actionButton) in actionButtons.enumerated() {
            let y = index > 0 ? actionButtons[index - 1].frame.maxY : minY
            actionButton.frame.origin = CGPoint(x: x, y: y)
            
            let width = maxWidth
            let height = actionButton.sizeThatFits(maxSize).height + 10
            
            actionButton.frame.size = CGSize(width: width, height: height)
        }
    }
    
    private func layoutSeparatorViews() {
        let x = titleLabel.frame.origin.x
        let width = frame.width - x
        let height: CGFloat = 1.0 / 3.0
        
        for (index, separatorView) in separatorViews.enumerated() {
            let y = actionButtons[index].frame.origin.y
            separatorView.frame = CGRect(x: x, y: y, width: width, height: height)
        }
    }
}
