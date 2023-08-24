//
//  AddNewPlaceVC.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 24.08.2023.
//

import UIKit
import SnapKit

class AddNewPlaceVC: UIViewController {
    
    private lazy var rectangle: UIView = {
        let line = UIView()
        line.backgroundColor = .systemGray
        line.layer.cornerRadius = 6
        return line
    }()
    
    private lazy var placeName: CustomTextField = {
        let view = CustomTextField()
        //view.labelText = "Place Name"
        view.placeholderName = "Please write a place name"
        view.txtField.text = ""
        view.txtField.attributedPlaceholder = NSAttributedString(string: "Place Name", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        
        return view
    }()
    
    private lazy var visitDescription: CustomTextView = {
        let view = CustomTextView()
        view.labelText = "Visit Description"
        view.txtView.frame = CGRect(x: 0, y: 0, width: 310, height: 162)
        view.txtView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing "
        return view
    }()

    private lazy var country: CustomTextField = {
        let view = CustomTextField()
        view.labelText = "Country, City"
        //view.placeholderName = "France, Paris"
        view.txtField.text = ""
        view.txtField.attributedPlaceholder = NSAttributedString(string: "France, Paris", attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemGray])
        
        return view
    }()
    
    private lazy var addPlaceBtn: CustomButton = {
        let btn = CustomButton()
        btn.labelText = "Add Place"
        btn.backgroundColor = Color.turquoise.color
        //btn.backgroundColor = Color.darkGray.color
        //btn.isEnabled = false
        //btn.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        
        return btn
    }()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = Color.lightGray.color

        setupView()

    }
    
    
    func setupView(){
        view.addSubviews(rectangle,
                         placeName,
                         visitDescription,
                         country,
                         addPlaceBtn)
        
        setupLayout()
        
    }
    
    func setupLayout(){
        
        rectangle.snp.makeConstraints({make in
            make.top.equalToSuperview().offset(10)
            make.centerX.equalToSuperview()
            make.width.equalTo(70)
            make.height.equalTo(8)
        })
        
        placeName.snp.makeConstraints({make in
            make.top.equalTo(rectangle.snp.bottom).offset(22)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-646)
        })
        
        visitDescription.snp.makeConstraints({make in
            make.top.equalTo(placeName.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-415)
        })
        
        country.snp.makeConstraints({make in
            make.top.equalTo(visitDescription.snp.bottom).offset(16)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-325)
        })
        
        addPlaceBtn.snp.makeConstraints({make in
            make.top.equalTo(country.snp.bottom).offset(247)
            make.leading.equalToSuperview().offset(24)
            make.trailing.equalToSuperview().offset(-24)
            make.bottom.equalToSuperview().offset(-24)
        })
        
        
    }
    

}
