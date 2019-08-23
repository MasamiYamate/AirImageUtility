//
//  AIUHttpRequest.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import UIKit
import SystemConfiguration

class AIUHttpRequest {
    
    enum AIUHttpRequestError: Error {
        case netWorkError
        case urlError
        case dataNotFound
    }
    
    func syncGet (_ reqPath: String) -> (Data? , URLResponse? , Error?) {
        var result: (Data? , URLResponse? , Error?) = (nil , nil , AIUHttpRequestError.dataNotFound)
        let semaphore = DispatchSemaphore.init(value: 0)
        asyncGet(reqPath, callback: {(data: Data?, res: URLResponse?, err: Error?) in
            result = (data, res, err)
            semaphore.signal()
        })
        semaphore.wait()
        return result
    }
    
    func asyncGet (_ reqPath: String , callback: ((Data? , URLResponse? , Error?) -> Void)?) {
        if !isNetworkActive(reqPath) {
            callback?(nil , nil , AIUHttpRequestError.netWorkError)
            return
        }
        guard let requestUrl: URL = URL(string: reqPath) else {
            callback?(nil , nil , AIUHttpRequestError.urlError)
            return
        }
        let config = URLSessionConfiguration.default
        config.timeoutIntervalForRequest = 60.0
        config.requestCachePolicy = .reloadIgnoringLocalCacheData
        let session = URLSession(configuration: config)
        let task = session.dataTask(with: requestUrl) { (data: Data?, res: URLResponse?, err: Error?) in
            callback?(data , res , err)
        }
        task.resume()
    }
    
    func syncPost (_ reqPath: String , reqParm: [String:Any]) -> (data: Data?, res: URLResponse?, err: Error?) {
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: reqParm, options: [])
        return syncPost(reqPath, reqJsonParm: jsonData)
    }
    
    func syncPost (_ reqPath: String , reqJsonParm: Data?) -> (data: Data?, res: URLResponse?, err: Error?) {
        var result: (Data? , URLResponse? , Error?) = (nil , nil , AIUHttpRequestError.dataNotFound)
        let semaphore = DispatchSemaphore.init(value: 0)
        asyncPost(reqPath, reqJsonParm: reqJsonParm, callback: {(data: Data?, res: URLResponse?, err: Error?) in
            result = (data, res, err)
            semaphore.signal()
        })
        semaphore.wait()
        return result
    }
    
    func asyncPost (_ reqPath: String , reqParm: [String:Any] , callback: ((Data? , URLResponse? , Error?) -> Void)?){
        let jsonData: Data? = try? JSONSerialization.data(withJSONObject: reqParm, options: .prettyPrinted)
        asyncPost(reqPath, reqJsonParm: jsonData, callback: {(data: Data?, res: URLResponse?, err: Error?) in
            callback?(data , res , err)
        })
    }
    
    func asyncPost (_ reqPath: String , reqJsonParm: Data? , callback: ((Data? , URLResponse? , Error?) -> Void)?) {
        if !isNetworkActive(reqPath) {
            callback?(nil , nil , AIUHttpRequestError.netWorkError)
        }
        guard let requestUrl: URL = URL(string: reqPath) else {
            callback?(nil , nil , AIUHttpRequestError.urlError)
            return
        }
        var urlRequest: URLRequest = URLRequest(url: requestUrl, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60.0)
        let session: URLSession = URLSession.shared
        
        urlRequest.httpMethod = "POST"
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = reqJsonParm
        
        let task = session.dataTask(with: urlRequest) { (data: Data?, res: URLResponse?, err: Error?) in
            callback?(data , res , err)
        }
        task.resume()
    }
    
    private func isNetworkActive (_ requestPath: String) -> Bool {
        guard let reachability = SCNetworkReachabilityCreateWithName(nil, requestPath) else {
            return false
        }
        var flags = SCNetworkReachabilityFlags.connectionAutomatic
        if !SCNetworkReachabilityGetFlags(reachability, &flags) {
            return false
        }
        let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
        let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
        return (isReachable && !needsConnection)
    }
    
}
