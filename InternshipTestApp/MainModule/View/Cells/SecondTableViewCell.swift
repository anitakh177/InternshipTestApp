//
//  SecondTableViewCell.swift
//  InternshipTestApp
//
//  Created by anita on 2/4/23.
//

import UIKit

final class SecondTableViewCell: UITableViewCell {
    
    // MARK: - Views
    
    private var commentLabel: UILabel = {
        let label = UILabel()
        label.text = """
                    Получай стипендию, выстраивай удобный график,
                    работай на современном железе.
                    """
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 14)
        label.textColor = ColorConstants.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let collectionView = DoubleCollectionView()
    
    // MARK: - Init
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

private extension SecondTableViewCell {
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 20),
          
            
            collectionView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: 12),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -279),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
}




