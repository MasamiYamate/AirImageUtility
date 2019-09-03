//
//  AIUFlashAirThumbnailRequest.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/28.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUFlashAirThumbnailRequest: AIUFlashAirDataRequestProtocol {
    typealias Response = (data: Data?, res: URLResponse?, err: Error?)
    
    private let httpRequest = AIUHttpRequest()
    
    var parameter: String
    
    func request(callback: (((data: Data?, res: URLResponse?, err: Error?)) -> Void)?) {
        let requestUrl = AIUFlashAirRequestTypes.ThumbnailCgi.get.url(imagePath: parameter)
        
        httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
            if let err = err {
                callback?((data: nil, res: nil, err: err))
                return
            }
            
            guard let data = data else {
                let dataErr = AIUHttpRequest.AIUHttpRequestError.dataNotFound
                callback?((data: nil, res: nil, err: dataErr))
                return
            }
            callback?((data: data, res: res, err: err))
        })
    }
    
}
