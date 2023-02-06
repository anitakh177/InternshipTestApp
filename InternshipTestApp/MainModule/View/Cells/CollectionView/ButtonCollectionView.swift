//
//  CollectionView.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import UIKit

final class ButtonCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
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
    
    private var jobs: [String] = ["IOS", "Android", "Design", "QA", "Flutter", "PM"]
    private let numberOfItems = 1000
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfItems
    }
    
    var previousSelected : IndexPath?
    var currentSelected : Int?
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "\(ButtonCollectionViewCell.self)", for: indexPath) as! ButtonCollectionViewCell
        
        let item = jobs[indexPath.row % jobs.count]
        cell.configureDataSource(title: item)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected")
        if let cell = self.cellForItem(at: indexPath) as? ButtonCollectionViewCell {
            
            if cell.contentView.backgroundColor == UIColor.gray {
                cell.contentView.backgroundColor = UIColor.black
            }
            else if cell.contentView.backgroundColor == UIColor.black {
                cell.contentView.backgroundColor = UIColor.gray
            }
            
            let itemToMove = jobs[indexPath.row % jobs.count]
             jobs.remove(at: indexPath.row % jobs.count )
             jobs.insert(itemToMove, at: 0) //move to front of array
             let destinationindexPath = NSIndexPath(row: 0, section: indexPath.section)
            self.moveItem(at: indexPath, to: destinationindexPath as IndexPath)
             
        }
        
        
    }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let item = jobs[indexPath.row % jobs.count]
            let itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
            ])
            
            return CGSize(width: itemSize.width+48, height: 44)
        }
        
        func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
            let indexPath = IndexPath(row: numberOfItems / 2, section: 0)
            self.scrollToItem(at: indexPath, at: .left, animated: false)
        }
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        
        
    }

