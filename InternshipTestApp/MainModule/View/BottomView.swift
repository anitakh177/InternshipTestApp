//
//  BottomView.swift
//  InternshipTestApp
//
//  Created by anita on 2/6/23.
//

import UIKit

final class BottomView: UIView {
    
    // MARK: - Events
    var didButtonTapped: (() -> Void)?
    
    // MARK: - Views
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Хочешь к нам?"
        label.font = .systemFont(ofSize: 14)
        label.textColor = ColorConstants.textColor
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private var button: UIButton = {
       let button = UIButton()
        button.setTitle("Отправить заявку", for: .normal)
        button.backgroundColor = ColorConstants.darkGrayColor
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    // MARK: - Init
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubview()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: Private Methods

private extension BottomView {
    
    @objc func didTapButton() {
        didButtonTapped?()
    }
    
    func configureSubview() {
        backgroundColor = .white
        addSubview(titleLabel)
        addSubview(button)
        setConstaints()
    }
    
    func setConstaints() {
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: button.leadingAnchor, constant: -24),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            button.trailingAnchor.constraint(equalTo: trailingAnchor),
            button.centerYAnchor.constraint(equalTo: centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: 60),
            button.widthAnchor.constraint(equalToConstant: 219)
        ])
        
        
    }
}
