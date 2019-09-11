//
//  AIUFlashAirThumbnailRequest.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/28.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFlashAirThumbnailRequest: AIUFlashAirDataRequestProtocol {
    typealias Response = Data
    
    private let httpRequest = AIUHttpRequest()
    
    var parameter: String
    
    func request() -> Observable<Data> {
        return Observable<Data>.create { observable in
            let requestUrl = AIUFlashAirRequestTypes.ThumbnailCgi.get.url(imagePath: self.parameter)

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
        }
    }
    
}
