//
//  ButtonCollectionViewCell.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import UIKit

final class ButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
       label.textColor = ColorConstants.darkGrayColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = ColorConstants.cellColor
        contentView.layer.cornerRadius = 12
        contentView.addSubview(titleLabel)
       
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Layout
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstaints()
        
    }
    
    // MARK: - Internal Methods
    
    func configureDataSource(title: String) {
        titleLabel.text = title
    }
    
    func selectedState() {
        contentView.backgroundColor = ColorConstants.darkGrayColor
        titleLabel.textColor = .white
    }
    
    func deselectedState() {
        contentView.backgroundColor = ColorConstants.cellColor
        titleLabel.textColor = ColorConstants.darkGrayColor
    }
    
    
}

// MARK: - Private Methods

private extension ButtonCollectionViewCell {
    
    func setConstaints() {
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
        titleLabel.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
}
