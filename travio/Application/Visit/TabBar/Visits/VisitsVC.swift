//
//  VisitsVC.swift
//  travio
//
//  Created by Doğucan Durgun on 20.08.2023.
//

import SnapKit
import UIKit

class VisitsVC: UIViewController {
    private lazy var retangle: UIView = {
        let view = CustomView()
        
        return view
    }()
    
    private lazy var header: UILabel = {
        let label = UILabel()
        label.text = "My Visits"
        label.font = Font.poppins(fontType: 600, size: 36).font
        label.textColor = .white
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupViews()
    }
    
    func setupViews() {
        self.view.backgroundColor = Colors.turkuaz.color
        self.navigationController?.navigationBar.isHidden = true
        view.addSubviews(retangle,header)
        
        setupLayouts()
        
        retangle.snp.makeConstraints { make in
            make.leading.trailing.bottom.equalToSuperview().offset(0)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(128)
        }
        
        header.snp.makeConstraints { make in
            make.leading.equalToSuperview().offset(24)
            make.top.equalTo(self.view.safeAreaLayoutGuide).offset(24)
        }
    }
    
    func setupLayouts() {}
}
