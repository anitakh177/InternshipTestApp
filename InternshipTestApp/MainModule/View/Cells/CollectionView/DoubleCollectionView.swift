//
//  DoubleCollectionView.swift
//  InternshipTestApp
//
//  Created by anita on 2/5/23.
//

import UIKit

final class DoubleCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource,
                                  UICollectionViewDelegateFlowLayout {
    
    // MARK: - Properties
    
    private var jobs: [String] = ["IOS", "Android", "Design", "QA", "Flutter", "PM", "dgjirjg", "BGURBG", "FHDUFGSD", "SIFHSAIBN", "ASFHUSFH", "ASFDHISF"]
    
    private var currentSelected = [Int]()
    
    // MARK: - Init
    
    init() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        layout.minimumInteritemSpacing = 12
        layout.minimumLineSpacing = 12
        showsHorizontalScrollIndicator = true
        translatesAutoresizingMaskIntoConstraints = false
        register(ButtonCollectionViewCell.self, forCellWithReuseIdentifier: "\(ButtonCollectionViewCell.self)")
        
    }
    
   // MARK: - Data Source
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jobs.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: "\(ButtonCollectionViewCell.self)", for: indexPath) as! ButtonCollectionViewCell
        
        let item = jobs[indexPath.row]
        cell.configureDataSource(title: item)
        
        currentSelected.contains(indexPath.row) ? cell.selectedState() : cell.deselectedState()
       
        return cell
    }
    
    // MARK: - Delegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemToMove = jobs[indexPath.row]
        jobs.remove(at: indexPath.row )
        jobs.insert(itemToMove, at: 0)
        let destinationindexPath = NSIndexPath(row: 0, section: indexPath.section)
        currentSelected.append(destinationindexPath.row)
            
        reloadData()
        self.moveItem(at: indexPath, to: destinationindexPath as IndexPath)
            
    }
        
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if  let cell = collectionView.cellForItem(at: indexPath) as? ButtonCollectionViewCell {
            if currentSelected.contains(indexPath.row) {
                cell.deselectedState()
                deselectItem(at: indexPath, animated: true)
                currentSelected.remove(at: currentSelected[indexPath.row])
            } else {
                selectItem(at: indexPath, animated: true, scrollPosition: [])
                return true
            }
        }

        return false
    }
    
    // MARK: - Delegate Flow Layout

        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let item = jobs[indexPath.row]
            let itemSize = item.size(withAttributes: [
                NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15)
            ])
            
            return CGSize(width: itemSize.width+48, height: 44)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }


