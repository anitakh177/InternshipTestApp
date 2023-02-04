//
//  ButtonCollectionViewCell.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import UIKit

final class ButtonCollectionViewCell: UICollectionViewCell {
    
    private var button: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
       
        button.titleLabel?.font = .systemFont(ofSize: 14)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 12
        contentView.addSubview(button)
       
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstaints()
    }
    
    func configureDataSource(title: String) {
        button.setTitle(title, for: .normal)
    }
}

// MARK: - Private Methods

private extension ButtonCollectionViewCell {
    
    func setConstaints() {
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            button.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            button.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            button.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
        button.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
}
