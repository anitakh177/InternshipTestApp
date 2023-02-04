//
//  MainViewController.swift
//  InternshipTestApp
//
//  Created by anita on 2/3/23.
//

import UIKit

final class MainViewController: UIViewController {
    // MARK: - View
    
    private let tableView = UITableView()
    
    
    // MARK: - Properties
    
    var presenter: MainViewOutput!
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
    
}
    // MARK: TableViewDelegate&DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FirstTableViewCell.self)", for: indexPath) as? FirstTableViewCell else { return UITableViewCell() }


        return cell
                
    }
    
}

// MARK: - Private Methods

private extension MainViewController {
    
    func configureHeaderView() {
      let headerView = StretchyTableHeaderView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 521))
        headerView.imageView.image = UIImage(named: "image")
        tableView.tableHeaderView = headerView
    }
    
    func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 140
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "\(FirstTableViewCell.self)")
    }
    
    func configureAppearance() {
        configureTableView()
        configureHeaderView()
        setTableViewConstaints()
        
    }
    
    func setTableViewConstaints() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
   
  
}
extension MainViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let header = tableView.tableHeaderView as? StretchyTableHeaderView else {
            return
        }
        header.scrollViewDidScroll(scrollView: tableView)
    }
}
    


extension MainViewController: MainViewInput {
    
   
}

