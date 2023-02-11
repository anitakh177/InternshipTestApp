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
        label.numberOfLines = 0
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
    
    
    // MARK: - Internal Methods
    
    func configureDataSource(jobs: Jobs) {
        commentLabel.text = jobs.firstDescription
        collectionView.jobs = jobs.names
    }
    
    
}
    
// MARK: - Private Methods

private extension FirstTableViewCell {
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: InsetConstants.horizontalInset),
            commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -InsetConstants.horizontalInset),
          
          
            
            collectionView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: InsetConstants.verticalInset),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: InsetConstants.horizontalInset),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -InsetConstants.verticalInset),
            collectionView.heightAnchor.constraint(equalToConstant: 44)
            
        ])
        
    }
}
