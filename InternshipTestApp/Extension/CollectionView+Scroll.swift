//
//  CollectionView+Scroll.swift
//  InternshipTestApp
//
//  Created by anita on 2/11/23.
//

import UIKit

extension UICollectionView {
    func scroll(toElementAtIndex index: Int) {
        let indexPath = IndexPath(item: index, section: 0)
        scrollToItem(at: indexPath, at: .left, animated: false)
    }
}
