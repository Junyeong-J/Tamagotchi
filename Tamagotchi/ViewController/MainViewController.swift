//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/8/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let deviceWidth = UIScreen.main.bounds.size.width
    let data = ["따끔따끔 다마고치":"1-7", "방실방실 다마고치":"2-7", "반짝반짝 다마고치":"3-7"]
    let noData = ["준비중이에요": "noImage"]
    
    let tableView = UITableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "다마고치 선택하기"
        
        view.backgroundColor = .white
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        configureTableView()
    }
    
}

extension MainViewController {
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.rowHeight = ((deviceWidth - 80) / 3) * 1.4 + 10
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        
        tableView.separatorStyle = .none
    }
    
}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.backgroundColor = .white
        if indexPath.row == 0{
            cell.data = data
            cell.count = 1
        } else {
            cell.data = noData
            cell.count = 2
        }
        return cell
    }
    
}
