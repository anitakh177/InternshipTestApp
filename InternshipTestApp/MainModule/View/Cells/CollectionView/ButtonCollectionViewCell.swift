//
//  ButtonCollectionViewCell.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import UIKit

final class ButtonCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Views
    
   private var titleButton: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    

    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .gray
        contentView.layer.cornerRadius = 12
        contentView.addSubview(titleButton)
       
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
        titleButton.text = title
    }
    
    
}

// MARK: - Private Methods

private extension ButtonCollectionViewCell {
    
    func setConstaints() {
        
        NSLayoutConstraint.activate([
            titleButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
            titleButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
            titleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
            titleButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
        ])
        titleButton.setContentCompressionResistancePriority(.defaultHigh, for: .horizontal)
    }
}
