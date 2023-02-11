//
//  MainRouter.swift
//  InternshipTestApp
//
//  Created by anita on 2/6/23.
//

import UIKit

final class MainRouter: MainRouterInput {
  
    // MARK: - Properties
    
    weak var view: ModuleTransitionable?
    
    // MARK: - MainRouterInput
   
    func showMessageModule(with title: String, with message: String) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "Закрыть", style: .default, handler: nil)
        alertController.addAction(cancelAction)
        alertController.view.tintColor = ColorConstants.darkGrayColor
        DispatchQueue.main.async {
            self.view?.presentModule(alertController, animated: true, completion: nil)
        }
        
        
    }
    
    
}
