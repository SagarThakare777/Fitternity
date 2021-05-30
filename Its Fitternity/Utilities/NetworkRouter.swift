//
//  NetworkRouter.swift
//  Its Fitternity
//
//  Created by SAGAR THAKARE on 30/05/21.
//

import Alamofire
import SystemConfiguration

//MARK:- Checking for Internet Connection
func isConnectedToNetwork() -> Bool {
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(MemoryLayout<sockaddr_in>.size)
    zeroAddress.sin_family = sa_family_t(AF_INET)
    
    guard let defaultRouteReachability = withUnsafePointer(to: &zeroAddress, {
        $0.withMemoryRebound(to: sockaddr.self, capacity: 1) {
            SCNetworkReachabilityCreateWithAddress(nil, $0)
        }
    }) else {
        return false
    }
    
    var flags: SCNetworkReachabilityFlags = []
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability, &flags) {
        return false
    }
    
    let isReachable = flags.contains(.reachable)
    let needsConnection = flags.contains(.connectionRequired)
    
    return (isReachable && !needsConnection)
}

extension DataRequest {
    private func decodableResponseSerializer<T: Decodable>() -> DataResponseSerializer<T> {
        return DataResponseSerializer { _, response, data, error in
            guard error == nil else { return .failure(error!) }
            guard let data = data else {
                return .failure(AFError.responseSerializationFailed(reason: .inputDataNil))
            }
            if let JSONString = String(data: data, encoding: .utf8) {
                print(JSONString)
            }
            
            return Result { try JSONDecoder().decode(T.self, from: data) }
        }
    }
    @discardableResult
    func responseDecodable<T: Decodable>(queue: DispatchQueue? = nil, completionHandler: @escaping (DataResponse<T>) -> Void) -> Self {
        return response(queue: queue, responseSerializer: decodableResponseSerializer(), completionHandler: completionHandler)
    }
}

enum BackendError: Error {
    case network(error: Error)
    case dataSerialization(error: Error)
    case jsonSerialization(error: Error)
    case xmlSerialization(error: Error)
    case objectSerialization(reason: String)
}

//MARK:- Network Router
enum NetworkRouter: URLRequestConvertible {
   
    case getHomeScreenAtHome
    case getHomeScreenInStudio
   
    //  1. Define Method
    var method: HTTPMethod {
        switch self {
        
        case .getHomeScreenAtHome:
            return .get
        case .getHomeScreenInStudio:
            return .get
            
        }
    }
    //  2. URL Path
    var path: String {
        
        switch self {
        
        case .getHomeScreenAtHome:
            return "HomeScreenAtHome.json"
        case .getHomeScreenInStudio:
            return "HomeScreenInStudio.json"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        
        let url = try BaseURL.mainBaseURL.asURL()
        let absoluteString = url.appendingPathComponent(path).absoluteURL.absoluteString.removingPercentEncoding!
        var urlRequest = URLRequest(url: URL(string: absoluteString)!)
        urlRequest.httpMethod = method.rawValue
        
        
        if(isConnectedToNetwork()) {
            
            switch self {
        
            default:
                break
            }
        }
        else {
            ErrorReporting.showMessage(title: "", msg: "Please check your internet connection.")
        }
        return urlRequest
    }
}
