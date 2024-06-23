//
//  NicknameViewController.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/13/24.
//

import UIKit
import SnapKit
import Toast

class NicknameViewController: UIViewController {
    
    let textField = NicknameTextField(style: .nickname)
    let lineView = UIView()
    var naviTitle: NaviTitle = .nick
    let ud = UserDefaultsManager.shared
    var checkNick: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        makeNavigationUI()
        
        setUI()
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
            make.top.equalTo(textField.snp.bottom)
            make.horizontalEdges.equalTo(textField)
        }
    }
    
    func configureUI() {
        view.backgroundColor = .white
        
        lineView.backgroundColor = .black
        
        if let nick = ud.nickname {
            textField.text = nick
        } else {
            textField.text = ""
        }
        
        textField.delegate = self
    }
    
    func makeNavigationUI() {
        
        navigationItem.title = naviTitle.nickTitle
        
        let storeButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(storeButtonClicked))
        navigationItem.rightBarButtonItem = storeButton
    }
    
    func setUI() {
        if let text = textField.text, text.count != 0 {
            checkNick = true
        } else {
            checkNick = false
        }
    }
    
    @objc func storeButtonClicked() {
        if checkNick{
            ud.nickname = textField.text
            navigationController?.popViewController(animated: true)
        } else {
            self.view.makeToast(NicknameError.count.requestError)
        }
    }
}

extension NicknameViewController: UITextFieldDelegate {
    
    func textFieldDidChangeSelection(_ textField: UITextField) {
        guard let text = textField.text else {return}
        
        do { try requestNick(text: text)
            checkNick = true
        } catch {
            checkNick = false
        }
    }
    
    func requestNick(text: String) throws {
        if !textLength(text: text) {
            throw NicknameError.count
        }
    }
    
    func textLength(text: String) -> Bool {
        return text.count >= 2 && text.count <= 6
    }
}
