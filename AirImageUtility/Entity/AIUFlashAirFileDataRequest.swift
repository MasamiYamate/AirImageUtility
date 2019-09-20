//
//  AIUFlashAirFileDataRequest.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/20.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFlashAirFileDataRequest: AIUFlashAirDataRequestProtocol {
    typealias Response = Data
    
    private let httpRequest = AIUHttpRequest()
    
    var filePath: String
    
    func request() -> Observable<Data> {
        return Observable<Data>.create { observable in
            let requestUrl = AIUFlashAirRequestTypes.fileData.get.url(with: self.filePath)
            
            self.httpRequest.asyncGet(with: requestUrl, callback: {(data: Data?, res: URLResponse?, err: Error?) in
                if let err = err {
                    observable.onError(err)
                    return
                }
                
                guard let data = data else {
                    let dataErr = AIUHttpRequest.AIUHttpRequestError.dataNotFound
                    observable.onError(dataErr)
                    return
                }
                observable.onNext(data)
                observable.onCompleted()
            })
            return Disposables.create()
        }
    }
    
}
