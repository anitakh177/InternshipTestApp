//
//  MainViewPresenter.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import Foundation

final class MainViewPresenter: MainViewOutput {
    
    // MARK: - Properties
    
    var dataSource = Jobs()
    weak var view: MainViewInput?
    var router: MainRouterInput?
    
    // MARK: - Init
    
    required init(view: MainViewInput) {
        self.view = view
    }
    
    // MARK: - Internal Methods
    
    func showAlertController() {
        router?.showMessageModule(with: "Поздравляем!", with: "Ваша заявка успешно отправлена!")
    }
    
}
