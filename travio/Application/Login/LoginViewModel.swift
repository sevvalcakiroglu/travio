//
//  LoginViewModel.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 20.08.2023.
//

import Foundation

class LoginViewModel {
    
    func login(input: LoginInfo, callback: @escaping (Error?) -> Void) {
        let url = "https://api.iosclass.live/v1/auth/login"

        let params = ["email": input.email,
                      "password": input.password]

        NetworkingHelper.shared.objectRequest(from: url, params: params, method: .post) { (result: Result<LoginReturn, Error>) in
            switch result {
            case .success(let data):
                _ = KeychainHelper.saveAccessToken(token: data.accessToken)
                callback(nil)
                print(data.accessToken)

            case .failure(let error):
                callback(error)
                print("Hata:", error.localizedDescription)
            }
        }
    }
    
    func loginNew(input: LoginInfo, callback: @escaping (Error?) -> Void) {

        let params = ["email": input.email,
                      "password": input.password]

        NetworkingHelper.shared.objectRequestNew(request: MyAPIRouter.postUserLogin(parameters: params)) { (result: Result<LoginReturn, Error>) in
            switch result {
            case .success(let data):
                _ = KeychainHelper.saveAccessToken(token: data.accessToken)
                callback(nil)
                print(data.accessToken)

            case .failure(let error):
                callback(error)
                print("Hata:", error.localizedDescription)
            }
        }
    }
}
