//
//  FirstCollectionTableViewCell.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import UIKit

final class FirstTableViewCell: UITableViewCell {
    
    // MARK: - Views
    
    private var commentLabel: UILabel = {
        let label = UILabel()
        label.text = """
                    Работай над реальными задачами под руководством
                    опытного наставника и получи возможность
                    стать частью команды мечты.
                    """
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 14)
        label.textColor = ColorConstants.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView = ButtonCollectionView()
    
    // MARK: - Initialization
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(commentLabel)
        contentView.addSubview(collectionView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setConstraints()
    }
    
    
}
    
// MARK: - Private Methods

private extension FirstTableViewCell {
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
          
            
            collectionView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
            collectionView.heightAnchor.constraint(equalToConstant: 44)
            
        ])
        
    }
}
