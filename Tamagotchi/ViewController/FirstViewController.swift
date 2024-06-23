//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by 전준영 on 6/8/24.
//

import UIKit
import SnapKit

class FirstViewController: UIViewController {
    
    let deviceWidth = UIScreen.main.bounds.size.width
    
    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout())
    
    func collectionViewLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let sectionSpacing: CGFloat = 20
        let cellSpacing: CGFloat = 16
        let width = UIScreen.main.bounds.width - (sectionSpacing * 2) - (cellSpacing * 3)
        layout.itemSize = CGSize(width: width/3, height: width/3 * 1.3)
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = cellSpacing
        layout.minimumInteritemSpacing = cellSpacing
        layout.sectionInset = UIEdgeInsets(top: sectionSpacing, left: sectionSpacing, bottom: sectionSpacing, right: sectionSpacing)
        return layout
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "다마고치 선택하기"
        
        configureHierarchy()
        configureLayout()
        configureUI()
        
        configureCollectionView()
    }
    
}

extension FirstViewController {
    
    func configureHierarchy() {
        
    }
    
    func configureLayout() {
        
    }
    
    func configureUI() {
        view.backgroundColor = .white
    }
    
    func configureCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(SelectCollectionViewCell.self, forCellWithReuseIdentifier: SelectCollectionViewCell.identifier)

    }
    
}

extension FirstViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelectCollectionViewCell.identifier, for: indexPath) as! SelectCollectionViewCell
        let tamagotchi: TamagotchiData
        switch indexPath.item {
        case 0:
            tamagotchi = .cactus
        case 1:
            tamagotchi = .sun
        case 2:
            tamagotchi = .star
        default:
            tamagotchi = .prepare
        }
        cell.configureData(tamagotchi: tamagotchi)
        return cell
    }
    
    
}

extension FirstViewController: FirstTableViewCellDelegate {
    func didSelectView(data: [String : String]) {
        let vc = PopUpViewController()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .overCurrentContext
        vc.data = data
        self.present(nav, animated: true)
    }
}
