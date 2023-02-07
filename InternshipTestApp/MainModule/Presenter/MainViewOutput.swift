//
//  MainViewOutput.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import Foundation

protocol MainViewOutput: AnyObject {
    init(view: MainViewInput)
    func showAlertController()
}
