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
    
    // MARK: - Internal Methods
    
    func configureDataSource(jobs: Jobs) {
        commentLabel.text = jobs.secondDescription
        collectionView.jobs = jobs.names
        collectionView.jobs += jobs.additionalNames
    }
    
}
    
// MARK: - Private Methods

private extension SecondTableViewCell {
    
    func setConstraints() {
        
        NSLayoutConstraint.activate([
            
            commentLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: InsetConstants.verticalInset),
            commentLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: InsetConstants.horizontalInset),
            commentLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -InsetConstants.horizontalInset),
          
            
            collectionView.topAnchor.constraint(equalTo: commentLabel.bottomAnchor, constant: InsetConstants.verticalInset),
            collectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: InsetConstants.horizontalInset),
            collectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -279),
            collectionView.heightAnchor.constraint(equalToConstant: 100)
            
        ])
        
    }
}




