//
//  DoubleCollectionView.swift
//  InternshipTestApp
//
//  Created by anita on 2/5/23.
//

import UIKit

final class DoubleCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

         init() {
            let layout = UICollectionViewFlowLayout()
             layout.scrollDirection = .horizontal
             super.init(frame: .zero, collectionViewLayout: layout)
             delegate = self
             dataSource = self
             layout.minimumLineSpacing = InsetConstants.minimLineSpacing
             showsHorizontalScrollIndicator = false
             translatesAutoresizingMaskIntoConstraints = false
             register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: "\(ButtonCollectionViewCell.self)")
             
        }
        
        private let jobs: [String] = ["IOS", "Android", "Design", "QA", "Flutter", "PM"]

        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return jobs.count * 2
        }

        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = dequeueReusableCell(withReuseIdentifier: "\(ButtonCollectionViewCell.self)", for: indexPath) as! ButtonCollectionViewCell
            var index = indexPath.item
                    if index > jobs.count - 1 {
                        index -= jobs.count
                    }
            let item = jobs[index % jobs.count]
            cell.configureDataSource(title: item)
            return cell
        }
        func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
            var offset = collectionView.contentOffset
            let width = collectionView.contentSize.width
                if offset.x < width/4 {
                    offset.x += width/2
                    collectionView.setContentOffset(offset, animated: false)
                } else if offset.x > width/4 * 3 {
                    offset.x -= width/2
                     collectionView.setContentOffset(offset, animated: false)
                    }
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            var index = indexPath.item
                    if index > jobs.count - 1 {
                        index -= jobs.count
                    }
            let item = jobs[index % jobs.count]
            let itemSize = item.size(withAttributes: [
                       NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
                   ])
                   
            return CGSize(width: itemSize.width+48, height: 44)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }

