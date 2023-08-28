//
//  HomeVC.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 20.08.2023.
//


import UIKit
import SnapKit

class HomeVC: UIViewController {
    
    private lazy var retangle: UIView = {
        let view = CustomView()
        
        return view
    }()
    
    private lazy var logo: UIImageView = {
        let logo = UIImageView()
        logo.image = UIImage(named: "travioLogo")
        
        return logo
    }()
    
    private lazy var travio: UILabel = {
        let lbl = UILabel()
        lbl.text = "Travio"
        lbl.textColor = Color.lightGray.color
        lbl.font = Font.semiBold(size: 32).font
        
        return lbl
    }()
    
    private lazy var collectionView:UICollectionView = {
        
        //MARK: -- CollectionView arayüzü için sağlanan layout protocolü.
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
        
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .clear
        cv.contentInsetAdjustmentBehavior = .never
        cv.showsHorizontalScrollIndicator = false
        cv.isPagingEnabled = true
        
        cv.register(HomeCollectionViewCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        return cv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    
    }
    
    func setupView(){
        
        view.backgroundColor = Color.turquoise.color
        navigationController?.navigationBar.isHidden = true
        view.addSubviews(retangle,logo,travio)
        retangle.addSubview(collectionView)
        
        setupLayout()
    }
    
    
    func setupLayout(){
        
        logo.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(28)
            make.leading.equalToSuperview().offset(16)
            make.trailing.equalToSuperview().offset(-308)
            make.bottom.equalToSuperview().offset(-754)

        }
        
        travio.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(44.28)
            make.leading.equalTo(logo.snp.trailing)
            make.trailing.equalToSuperview().offset(202.46)
            make.bottom.equalTo(logo.snp.bottom)
        })
        
        retangle.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(125)
            make.leading.trailing.bottom.equalToSuperview().offset(0)
        }
        
        collectionView.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(212)
            make.bottom.equalToSuperview().offset(-454)
            make.leading.equalToSuperview().offset(18)
            make.trailing.equalToSuperview()
            
        })
        
        
    }
    
    
}




extension HomeVC: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 278, height: 178)
        return size
    }
    
}


extension HomeVC: UICollectionViewDataSource{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return 3
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as? HomeCollectionViewCell else { return UICollectionViewCell() }
        
        return cell
    }
    
    
}
