//
//  MainViewPresenter.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import Foundation

final class MainViewPresenter: MainViewOutput {
    
    required init(view: MainViewInput) {
        self.view = view
    }
    
    weak var view: MainViewInput?
    var router: MainRouterInput?
    
    func showAlertController() {
        router?.showMessageModule(with: "Поздравляем!", with: "Ваша заявка успешно отправлена!")
    }
    
}
