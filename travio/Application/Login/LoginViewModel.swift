//
//  LoginViewModel.swift
//  travio
//
//  Created by Doğucan Durgun on 20.08.2023.
//

import Foundation

class LoginViewModel {

    func login(input: LoginInfo, callback: @escaping () -> Void) {
        let url = "https://api.iosclass.live/v1/auth/login"
        
        let params = ["email": input.email,
                      "password": input.password,
                    ]
        
        NetworkingHelper.shared.objectRequest(from: url, params: params, method: .post) { (result: Result<LoginReturn, Error>) in
            switch result {
            case .success(let data):
                _ = KeychainHelper.saveAccessToken(token: data.accessToken)
                callback()
                print(KeychainHelper.loadAccessToken()!)
                
            case .failure(let error):
                print("Hata:", error.localizedDescription)
            }
        }
    }
}
