//
//  SignUpViewModel.swift
//  travio
//
//  Created by Doğucan Durgun on 20.08.2023.
//

import Alamofire
import Foundation

class SignUpViewModel {

    func register(input: RegisterInfo, callback: @escaping () -> Void) {
        let url = "https://api.iosclass.live/v1/auth/register"
        
        let params = ["full_name": input.full_name,
                      "email": input.email,
                      "password": input.password]
        
        NetworkingHelper.shared.objectRequest(from: url, params: params, method: .post) { (result: Result<RegisterReturn, Error>) in
            switch result {
            case .success:
                callback()
                
            case .failure(let error):
                print("Hata:", error.localizedDescription)
            }
        }
    }
}
    
