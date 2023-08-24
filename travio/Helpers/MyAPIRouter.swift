//
//  Router.swift
//  travio
//
//  Created by Şevval Çakıroğlu on 24.08.2023.
//

import Foundation
import Alamofire
import SwiftyJSON

public enum MyAPIRouter: URLRequestConvertible {

//    static let baseURL = "https://api.iosclass.live"
    var baseURL: String {
        return "https://api.iosclass.live"
    }
    
    // API'nin temel URL'i
    //static let authToken = "token gelecek" // buraya token eklenecek
    
    var token:String {
        guard let token = KeychainHelper.loadAccessToken() else { return "" }
       return token
    }

        case postRegister(parameters: [String: Any])
        case postUserLogin(parameters: [String: Any])
        case getUser
        case getListTravel
        case getTravel(travelId:String)
        case updateTravel(travelId:String)
        case deleteTravel(travelId:String)
        case getAllGalleries(travelId: String)
        case deleteGalleries(travelId: String, imageId:String)
    
//    var authToken: String{
//        
//        return KeychainHelper.saveAccessToken(token: data.accessToken)
//    }

    var method: HTTPMethod {
            switch self {
            case .postUserLogin, .postRegister:
                return .post
            case .getUser, .getListTravel, .getTravel, .getAllGalleries:
                return .get
            case .updateTravel:
                return .put
            case .deleteTravel, .deleteGalleries:
                return .delete
            }
        }

    
    var path: String {
            switch self {
            case .postRegister(_):
                return "/v1/auth/register"
            case .postUserLogin(_):
                return "/v1/auth/login"
            case .getUser:
                return "/v1/me"
            case .getListTravel:
                return "/v1/travels?page=1&limit=10"
            case .getTravel(let travelId), .updateTravel(let travelId),
                    .deleteTravel(let travelId), .getAllGalleries(let travelId):
                return "/v1/travels/\(travelId)"
            case .deleteGalleries(let travelId, let imageId):
                return "/v1/galleries/\(travelId)/\(imageId)"

            }
        }
    
    var parameters: Parameters? {
            switch self {
//            case .getUser, .getListTravel,
//                    .getTravel,.updateTravel,
//                    .deleteTravel,.getAllGalleries,.deleteGalleries:
//                return nil
            case .postRegister(let parameters), .postUserLogin(let parameters):
                return parameters
            default :
                return [:]
            }
        }
    
    var headers: HTTPHeaders {
        
        switch self {
        case .postUserLogin, .postRegister:
            return [:]
        case .getListTravel, .getUser, .getTravel, .updateTravel, .deleteTravel,
                .getAllGalleries, .deleteGalleries:
            return ["Authorization" : "Bearer \(token)"]
//        default:
//            return [:]
        }
        
        
//            var headers: HTTPHeaders = [
//                "Accept": "application/json"
//            ]
            
            // Eğer token mevcutsa, Authorization header eklenir
//           if let authToken = MyAPIRouter.authToken {
        
//                    }
//            return headers
        }
    
    
    
    public func asURLRequest() throws -> URLRequest {
            let url = try baseURL.asURL()
            var request = URLRequest(url: url.appendingPathComponent(path))
            request.httpMethod = method.rawValue
            request.timeoutInterval = TimeInterval(10 * 1000) // Timeout süresi
            request.headers = headers
            
            
//            if let parameters = parameters {
//                request = try JSONEncoding.default.encode(request, with: parameters)
//            }
        
//
        let encoding: ParameterEncoding = {
            switch method{
            case .get:
               return URLEncoding.default
            default:
               return JSONEncoding.default
            }
        }()
        
        return try encoding.encode(request, with: parameters)
        }
    
    }

    
//func asURLRequest() throws -> URLRequest {
//        let url = baseURL.appendingPathComponent(path)
//        var request = URLRequest(url: url)
//        request.method = method
//
//        switch self {
//        case let .get(parameters):
//            request = try URLEncodedFormParameterEncoder().encode(parameters, into: request)
//        case let .post(parameters):
//            request = try JSONParameterEncoder().encode(parameters, into: request)
//        }
//
//        return request
//    }









//------------ KULLANIMI -------------
//// Router kullanımı
//let getUserRequest = AF.request(MyAPIRouter.getUserDetails(userID: 123))
//getUserRequest.responseJSON { response in
//    // Yanıtı işleme kodları burada yer alır
//}
//
//// updateUser örneği
//let updateParameters: [String: Any] = ["name": "Yeni İsim"]
//let updateUserRequest = AF.request(MyAPIRouter.updateUser(userID: 456, parameters: updateParameters))
//updateUserRequest.responseJSON { response in
//    // Yanıtı işleme kodları burada yer alır
//}
