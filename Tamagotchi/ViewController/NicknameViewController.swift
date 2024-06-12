//
//  NicknameViewController.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/13/24.
//

import UIKit
import SnapKit

class NicknameViewController: UIViewController {
    
    let textField = UITextField()
    let lineView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        makeNavigationUI()
    }
    
    
}

extension NicknameViewController {
    
    func configureHierarchy() {
        view.addSubview(textField)
        view.addSubview(lineView)
    }
    
    func configureLayout() {
        textField.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.top.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(20)
            
        }
        
        lineView.snp.makeConstraints { make in
            make.height.equalTo(1)
            make.top.equalTo(textField.snp.bottom).offset(2)
            make.leading.trailing.equalTo(textField)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        textField.backgroundColor = .brown
        lineView.backgroundColor = .black
    }
    
    func makeNavigationUI() {
        navigationItem.title = "대장님 이름 정하기"
        
        let storeButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(storeButtonClicked))
        navigationItem.rightBarButtonItem = storeButton
    }
    
    @objc func storeButtonClicked() {
        navigationController?.popViewController(animated: true)
    }
}
