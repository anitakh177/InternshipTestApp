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
    private let bottomView = BottomView()
    
    // MARK: - Properties
    
    var presenter: MainViewOutput!
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureAppearance()
        
    }
    
}
    // MARK: TableViewDelegate&DataSource

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(FirstTableViewCell.self)", for: indexPath) as? FirstTableViewCell else { return UITableViewCell() }
            cell.selectionStyle = .none
            cell.configureDataSource(jobs: presenter.dataSource)
            return cell

        case 1:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "\(SecondTableViewCell.self)", for: indexPath) as?
                    SecondTableViewCell else { return UITableViewCell()}
            cell.selectionStyle = .none
            cell.configureDataSource(jobs: presenter.dataSource)
            return cell
           
        default:
            return UITableViewCell()
        }
        
                
    }
    
   func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 130
        } else {
            return 442
            
        }
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
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        tableView.separatorStyle = .none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: "\(FirstTableViewCell.self)")
        tableView.register(SecondTableViewCell.self, forCellReuseIdentifier: "\(SecondTableViewCell.self)")
        setTableViewConstaints()
       
    }
    
    func configureAppearance() {
        view.backgroundColor = .white
        configureBottomView()
        configureTableView()
        configureHeaderView()
    }
    
    func setTableViewConstaints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomView.topAnchor, constant: -32)
        ])
    }
    
    func configureBottomView() {
        bottomView.didButtonTapped = { [weak self] in
            self?.presenter.showAlertController()
        }
        
        view.addSubview(bottomView)
        bottomView.translatesAutoresizingMaskIntoConstraints = false
        setBottomViewConstraints()
    }
    
    func setBottomViewConstraints(){
        NSLayoutConstraint.activate([
            bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: InsetConstants.horizontalInset),
            bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -InsetConstants.verticalInset),
            bottomView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -44),
            bottomView.heightAnchor.constraint(equalToConstant: 60)
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
    


extension MainViewController: MainViewInput, ModuleTransitionable {
    
   
}

