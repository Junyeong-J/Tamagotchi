//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/9/24.
//

import UIKit
import SnapKit

class MainViewController: UIViewController {
    
    let deviceWidth = UIScreen.main.bounds.size.width
    
    let tamagotchiImageView = UIImageView()
    
    let bubbleImageView = UIImageView()
    let explainLabel = UILabel()
    
    let nameView = UIView()
    let nameLabel = UILabel()
    
    let levelCountLabel = UILabel()
    
    let riceTextField = UITextField()
    let riceLine = UIView()
    let riceButton = UIButton()
    let riceStackView = UIStackView()
    
    let waterTextField = UITextField()
    let waterLine = UIView()
    let waterButton = UIButton()
    let waterStackView = UIStackView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        makeNavigationUI()
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        setData()
    }
    
    
}

extension MainViewController {
    
    func makeNavigationUI() {
        
        let navigationBarAppearance = UINavigationBarAppearance()
        navigationBarAppearance.configureWithOpaqueBackground()
        
        UINavigationBar.appearance().standardAppearance = navigationBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navigationBarAppearance
        
        navigationItem.title = "대장님의 다마고치"
        
        navigationController?.navigationBar.standardAppearance = navigationBarAppearance
        navigationController?.navigationBar.scrollEdgeAppearance = navigationBarAppearance
        navigationController?.navigationBar.compactAppearance = navigationBarAppearance
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.tintColor = .black
        
        navigationItem.hidesBackButton = true
        
        let userButton = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(userButtonClicked))
        navigationItem.rightBarButtonItem = userButton
    }
    
    func configureHierarchy(){
        view.addSubview(tamagotchiImageView)
        view.addSubview(bubbleImageView)
        bubbleImageView.addSubview(explainLabel)
        view.addSubview(nameView)
        nameView.addSubview(nameLabel)
        view.addSubview(levelCountLabel)
        
        view.addSubview(riceStackView)
        riceStackView.addArrangedSubview(riceTextField)
        riceStackView.addArrangedSubview(riceButton)
        view.addSubview(riceLine)
        
        view.addSubview(waterStackView)
        waterStackView.addArrangedSubview(waterTextField)
        waterStackView.addArrangedSubview(waterButton)
        view.addSubview(waterLine)
    }
    
    func configureLayout(){
        tamagotchiImageView.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.size.equalTo(deviceWidth - 200)
        }
        
        bubbleImageView.snp.makeConstraints { make in
            make.centerX.width.equalTo(tamagotchiImageView)
            make.height.equalTo((deviceWidth - 200) * 0.6)
            make.bottom.equalTo(tamagotchiImageView.snp.top).offset(-10)
        }
        
        explainLabel.snp.makeConstraints { make in
            make.top.leading.equalTo(bubbleImageView).offset(5)
            make.bottom.trailing.equalTo(bubbleImageView).offset(-5)
        }
        
        nameView.snp.makeConstraints { make in
            make.centerX.equalTo(tamagotchiImageView)
            make.width.equalTo(100)
            make.top.equalTo(tamagotchiImageView.snp.bottom).offset(10)
            make.height.equalTo(30)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.center.equalTo(nameView)
        }
        
        levelCountLabel.snp.makeConstraints { make in
            make.top.equalTo(nameView.snp.bottom).offset(10)
            make.centerX.equalTo(tamagotchiImageView)
            make.width.equalTo(150)
            make.height.equalTo(20)
        }
        
        riceStackView.snp.makeConstraints { make in
            make.top.equalTo(levelCountLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(70)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-70)
            make.height.equalTo(40)
        }
        
        riceTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        riceButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        riceLine.snp.makeConstraints { make in
            make.top.equalTo(riceTextField.snp.bottom).offset(2)
            make.leading.trailing.equalTo(riceTextField)
            make.height.equalTo(1)
        }
        
        waterStackView.snp.makeConstraints { make in
            make.top.equalTo(riceStackView.snp.bottom).offset(5)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(70)
            make.trailing.equalTo(view.safeAreaLayoutGuide).offset(-70)
            make.height.equalTo(40)
        }
        
        waterTextField.snp.makeConstraints { make in
            make.height.equalTo(30)
        }
        
        waterButton.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(30)
        }
        
        waterLine.snp.makeConstraints { make in
            make.top.equalTo(waterTextField.snp.bottom).offset(2)
            make.leading.trailing.equalTo(waterTextField)
            make.height.equalTo(1)
        }
        
    }
    
    func configureUI(){
        tamagotchiImageView.setImageViewUI(contentMode: .scaleAspectFill, cornerRadius: (deviceWidth - 200) / 2)
        
        bubbleImageView.setImageViewUI(contentMode: .scaleAspectFill, cornerRadius: 0)
        
        explainLabel.setUILabel("대장님 오을 깃허브 푸시 하셨어요?", textAlignment: .center, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 13), cornerRadius: 0, numberLine: 0)
        
        
        nameView.setViewUI(backgroundColor: .white, cornerRadius: 5, borderColor: UIColor.black.cgColor, borderWidth: 1)
        
        levelCountLabel.setUILabel("", textAlignment: .center, color: .black, backgroundColor: .clear, font: .systemFont(ofSize: 13), cornerRadius: 0, numberLine: 1)
        
        riceStackView.alignment = .center
        riceStackView.axis = .horizontal
        riceStackView.distribution = .fillProportionally
        riceStackView.spacing = 10
        
        riceTextField.backgroundColor = .clear
        riceTextField.placeholder = "밥주세용"
        riceTextField.textAlignment = .center
        
        riceButton.setButtonUI(title: "밥먹기", font: .systemFont(ofSize: 14), titleColor: .black, backgroundColor: .white, cornerRadius: 5, borderWidth: 1, borderColor: UIColor.black.cgColor, tagNum: 0)
        
        riceLine.backgroundColor = .black
        
        waterStackView.alignment = .center
        waterStackView.axis = .horizontal
        waterStackView.distribution = .fillProportionally
        waterStackView.spacing = 10
        
        waterTextField.backgroundColor = .clear
        waterTextField.placeholder = "물주세용"
        waterTextField.textAlignment = .center
        
        waterButton.setButtonUI(title: "물먹기", font: .systemFont(ofSize: 14), titleColor: .black, backgroundColor: .white, cornerRadius: 5, borderWidth: 1, borderColor: UIColor.black.cgColor, tagNum: 0)
        
        waterLine.backgroundColor = .black
    }
    
    func setData() {
        tamagotchiImageView.image = UIImage(named: "1-1")
        bubbleImageView.image = UIImage(named: "bubble")
        
    }
    
    @objc func userButtonClicked() {
        let vc = SettingViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
}

