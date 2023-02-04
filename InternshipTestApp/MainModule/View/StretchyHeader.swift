//
//  StretchyHeader.swift
//  InternshipTestApp
//
//  Created by anita on 2/4/23.
//

import Foundation
import UIKit

final class StretchyTableHeaderView: UIView {
    
    public var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let roundedView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.layer.cornerRadius = 32
        view.heightAnchor.constraint(equalToConstant: 68).isActive = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
         label.text = "Стажировка в Surf"
         label.font = .systemFont(ofSize: 24, weight: .bold)
         label.translatesAutoresizingMaskIntoConstraints = false
         return label
    }()
  
    
    private var imageViewHeight = NSLayoutConstraint()
    private var imageViewBottom = NSLayoutConstraint()
    private var containerView = UIView()
    private var containerViewHeight = NSLayoutConstraint()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        createViews()
        setViewContsraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Notify view of scroll change from container
    public func scrollViewDidScroll(scrollView: UIScrollView) {
        containerViewHeight.constant = scrollView.contentInset.top
        let offsetY = -(scrollView.contentOffset.y + scrollView.contentInset.top)
        containerView.clipsToBounds = offsetY <= 0
        imageViewBottom.constant = offsetY >= 0 ? 0 : -offsetY / 2
        imageViewHeight.constant = max(44, scrollView.contentInset.top)
        //offsetY + scrollView.contentInset.top
    }
}

// MARK: - Private Methods

private extension StretchyTableHeaderView {
    
    func createViews() {
        addSubview(containerView)
        containerView.addSubview(imageView)
        containerView.addSubview(roundedView)
        roundedView.addSubview(titleLabel)
    }
    
    func setViewContsraints() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        
        NSLayoutConstraint.activate([
            widthAnchor.constraint(equalTo: containerView.widthAnchor),
            centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            heightAnchor.constraint(equalTo: containerView.heightAnchor),
            
            roundedView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            roundedView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            roundedView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: roundedView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: roundedView.trailingAnchor, constant: 20),
            titleLabel.topAnchor.constraint(equalTo: roundedView.topAnchor, constant: 24),
            
            
            containerView.widthAnchor.constraint(equalTo: imageView.widthAnchor),
        ])
        
        containerViewHeight = containerView.heightAnchor.constraint(equalTo: self.heightAnchor)
        containerViewHeight.isActive = true
        
        imageViewBottom = imageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
        imageViewBottom.isActive = true
        imageViewHeight = imageView.heightAnchor.constraint(equalTo: containerView.heightAnchor)
        imageViewHeight.isActive = true
        
    }
    
   
}
