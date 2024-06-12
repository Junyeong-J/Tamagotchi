//
//  SettingViewController.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/12/24.
//

import UIKit
import SnapKit

class SettingViewController: UIViewController {

    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        
        configureUI()
        makeNavigationUI()
    }

}

extension SettingViewController {
    
    func configureTableView() {
        view.addSubview(tableView)
        
        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: SettingTableViewCell.identifier)
        tableView.rowHeight = 44
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func makeNavigationUI() {
        navigationItem.title = "설정"
        self.navigationController?.navigationBar.topItem?.title = ""
        
    }
}

extension SettingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Setting.allCases.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingTableViewCell.identifier, for: indexPath) as! SettingTableViewCell
        cell.configureSet(icon: Setting.allCases[indexPath.row].icon, title: Setting.allCases[indexPath.row].title)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.row {
        case 0:
            let vc = NicknameViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = FirstViewController()
            navigationController?.pushViewController(vc, animated: true)
        case 2:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처믕부터 시작하실 건가용?", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: "웅", style: .default, handler: nil))
            alert.addAction(UIAlertAction(title: "아냐!", style: .cancel, handler: nil))
            
            present(alert, animated: true)
        default:
            break
        }
    }
    
}
