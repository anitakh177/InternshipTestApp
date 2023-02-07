//
//  MainModuleConfigurator.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import UIKit
 
final class MainModuleConfigurator {
    
    func configureMainModule() -> UIViewController {
        let view = MainViewController()
        let presenter = MainViewPresenter(view: view)
        let router = MainRouter()
        
        presenter.router = router
        router.view = view
        view.presenter = presenter
        return view
    }
}
