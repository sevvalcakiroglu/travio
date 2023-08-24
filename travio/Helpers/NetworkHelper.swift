//
//  NetworkHelper.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 20.08.2023.
//

import Foundation
import Alamofire


enum APIEndpoint {
    
    case registerUser
    case login
    case me
    case createTravels
    case travels
    case galleries
    case deleteUser(userid:String)


    
    var path: String {
        switch self {
        case .registerUser:
            return "/v1/auth/register"
        case .deleteUser(let userid):
            return "User\(userid)"
        case .login:
            return "/v1/auth/login"
        case .me:
            return "/v1/me"
        case .createTravels:
            return "/v1/travels"
        case .travels:
            return "/v1/travels?page=1&limit=10"
        case .galleries:
            return "https://api.iosclass.live/v1/galleries/travelId"
        }
    }
    
    var baseUrl: String {
        return "https://api.iosclass.live"
    }
    
    var url: URLConvertible {
        return "\(baseUrl)\(path)"
    }
}




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
                 
                    
                } catch {
                    callback(.failure(error))
            
                }
            case .failure(let err):
                callback(.failure(err))
                
            }
        }
    }
    
    func arrayRequest<T: Codable>(from apiUrl: String, params: Parameters, method: HTTPMethod,headers: HTTPHeaders, callback: @escaping (Result<[T], Error>) -> Void) {
        AF.request(apiUrl,
                   method: method,
                   parameters: params,
                   encoding: URLEncoding.default,
                   headers: headers).validate().responseJSON { response in
            
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
    
    
    func objectRequestNew<T:Codable>(request:URLRequestConvertible,callback: @escaping (Result<T,Error>) -> Void) {
        
        AF.request(request).responseJSON{ response in
            
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
}
