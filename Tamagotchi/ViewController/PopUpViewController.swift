//
//  PopUpViewController.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/9/24.
//

import UIKit
import SnapKit

class PopUpViewController: UIViewController {

    let deviceWidth = UIScreen.main.bounds.size.width
    let deviceheight = UIScreen.main.bounds.size.height
    
    var data: TamagotchiData?
    
    let popUpView = UIView()
    
    let imageView = UIImageView()
    let nameView = UIView()
    let nameLabel = UILabel()
    let stackView = UIStackView()
    
    let lineView = UIView()
    
    let explainLabel = UILabel()
    let cancelButton = UIButton()
    let startButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHierarchy()
        configureLayout()
        configureUI()
        
        addTarget()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setDataUI()
    }
    
}

extension PopUpViewController {
    
    func configureHierarchy(){
        view.addSubview(popUpView)
        popUpView.addSubview(stackView)
        stackView.addArrangedSubview(imageView)
        stackView.addArrangedSubview(nameView)
        nameView.addSubview(nameLabel)
        
        popUpView.addSubview(lineView)
        
        popUpView.addSubview(cancelButton)
        popUpView.addSubview(startButton)
        popUpView.addSubview(explainLabel)
    }
    
    func configureLayout(){
        popUpView.snp.makeConstraints { make in
            make.center.equalTo(view.safeAreaLayoutGuide)
            make.height.equalTo(deviceheight * 0.5)
            make.width.equalTo(deviceWidth - 80)
        }
        
        imageView.snp.makeConstraints { make in
            make.size.equalTo(120)
        }
        
        nameView.snp.makeConstraints { make in
            make.width.equalTo(150)
            make.height.equalTo(30)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalTo(nameView)
        }
        
        stackView.snp.makeConstraints { make in
            make.bottom.equalTo(popUpView.snp.centerY).offset(-20)
            make.centerX.equalTo(popUpView)
        }
        
        lineView.snp.makeConstraints { make in
            make.leading.equalTo(popUpView).offset(30)
            make.trailing.equalTo(popUpView).offset(-30)
            make.top.equalTo(popUpView.snp.centerY)
            make.height.equalTo(1)
        }
        
        cancelButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.leading.bottom.equalTo(popUpView)
            make.trailing.equalTo(popUpView.snp.centerX)
        }
        
        startButton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.trailing.bottom.equalTo(popUpView)
            make.leading.equalTo(popUpView.snp.centerX)
        }
        
        explainLabel.snp.makeConstraints { make in
            make.top.equalTo(lineView.snp.bottom).offset(20)
            make.leading.equalTo(popUpView).offset(30)
            make.trailing.equalTo(popUpView).offset(-30)
            make.bottom.equalTo(startButton.snp.top).offset(-30)
        }
    }
    
    func configureUI(){
        view.backgroundColor = #colorLiteral(red: 0.5145593286, green: 0.5145593286, blue: 0.5145593286, alpha: 0.2664746979)
        
        popUpView.setViewUI(backgroundColor: .white, cornerRadius: 10, borderColor: UIColor.clear.cgColor, borderWidth: 0)

        imageView.setImageViewUI(contentMode: .scaleAspectFill, cornerRadius: 60)
        
        nameView.setViewUI(backgroundColor: .white, cornerRadius: 5, borderColor: UIColor.black.cgColor, borderWidth: 1)
        
        nameLabel.text = "ㅎㅎㅎ"
        
        stackView.spacing = 10
        stackView.alignment = .center
        stackView.axis = .vertical
        
        lineView.setViewUI(backgroundColor: .black, cornerRadius: 0, borderColor: UIColor.clear.cgColor, borderWidth: 0)
        
        cancelButton.setButtonUI(title: "취소", font: .systemFont(ofSize: 15), titleColor: .darkGray, backgroundColor: .white, cornerRadius: 5, borderWidth: 0.5, borderColor: UIColor.lightGray.cgColor, tagNum: 1)
        cancelButton.setButtonCorners(setCorners: [.layerMinXMaxYCorner])
        
        startButton.setButtonUI(title: "시작하기", font: .systemFont(ofSize: 15), titleColor: .darkGray, backgroundColor: .white, cornerRadius: 5, borderWidth: 0.5, borderColor: UIColor.lightGray.cgColor, tagNum: 1)
        startButton.setButtonCorners(setCorners: [.layerMaxXMaxYCorner])
        
        explainLabel.setUILabel("", textAlignment: .center, color: .black, backgroundColor: .white, font: .systemFont(ofSize: 13), cornerRadius: 0, numberLine: 0)
        
        
    }
    
    func setDataUI() {
        if let tamagotchiImage = data?.image, let name = data?.name, let explain = data?.explain{
            imageView.image = UIImage(named: tamagotchiImage)
            nameLabel.text = name
            explainLabel.text = explain
        }
    }
    
    func addTarget() {
        cancelButton.addTarget(self, action: #selector(cancelButtonClicked), for: .touchUpInside)
        startButton.addTarget(self, action: #selector(startButtonClicked), for: .touchUpInside)
    }
    
    @objc func cancelButtonClicked() {
        dismiss(animated: true)
    }
    
    @objc func startButtonClicked() {
        let vc = MainViewController()
        navigationController?.pushViewController(vc, animated: false)
    }
}
