//
//  NetworkHelper.swift
//  travio
//
//  Created by Doğucan Durgun on 20.08.2023.
//

import Foundation
import Alamofire

class NetworkingHelper {
    
    
    static let shared = NetworkingHelper()
    
    func objectRequestwithHeader<T:Codable>(from apiUrl:String, params:Parameters, method:HTTPMethod,header:HTTPHeaders? = nil,callback: @escaping (Result<T,Error>) -> Void) {
        
        AF.request(apiUrl,
                   method:method,
                   parameters: params,
                   encoding:URLEncoding.default,
                   headers: header).responseJSON{ response in
            
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                    callback(.success(decodedData))
                  
                } catch {
                    callback(.failure(error))
            
                }
            case .failure(let err):
                callback(.failure(err))
                
            }
        }
    }
    
    func objectRequest<T:Codable>(from apiUrl:String, params:Parameters, method:HTTPMethod,callback: @escaping (Result<T,Error>) -> Void) {
        
        AF.request(apiUrl,
                   method:method,
                   parameters: params,
                   encoding:JSONEncoding.default).responseJSON{ response in
            
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode(T.self, from: jsonData)
                    callback(.success(decodedData))
                    //print(decodedData)
                } catch {
                    callback(.failure(error))
            
                }
            case .failure(let err):
                callback(.failure(err))
                
            }
        }
    }
    
    func arrayRequest<T:Codable>(from apiUrl:String, params:Parameters, method:HTTPMethod, callback: @escaping (Result<[T],Error>) -> Void) {
        
        AF.request(apiUrl,
                   method:method,
                   parameters: params,
                   encoding:JSONEncoding.default).validate().responseJSON{ response in
            
            switch response.result {
            case .success(let value):
                do {
                    let jsonData = try JSONSerialization.data(withJSONObject: value)
                    let decodedData = try JSONDecoder().decode([T].self, from: jsonData)
                    callback(.success(decodedData))
                } catch {
                    callback(.failure(error))
                }
            case .failure(let err):
                callback(.failure(err))
            }
        }
    }
}
