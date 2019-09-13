//
//  AIUControlImageDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUControlImageDataStore {
    
    private let disposeBag = DisposeBag()
    
    func request() -> Observable<String> {
        let controlImage = AIUFlashAirCommandRequest.AIUControlImage()
        let controlImageObservable = controlImage.request()
        return controlImageObservable
    }
    
}
