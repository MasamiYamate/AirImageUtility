//
//  AIUBlancSectorCountDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUBlancSectorCountDataStore {
    
    private let disposeBag = DisposeBag()
    
    func request() -> Observable<AIUBlancSectorCountDataModel> {
        return Observable<AIUBlancSectorCountDataModel>.create { observable in
            let sectorSize = AIUFlashAirCommandRequest.AIUBlancSectorCount()
            let sectorSizeObservable = sectorSize.request()
            sectorSizeObservable.subscribe(onNext: { response in
                do {
                    let model = try AIUBlancSectorCountDataModelTranslator().translate(with: response)
                    observable.onNext(model)
                } catch {
                    observable.onError(error)
                }
            }, onError: { err in
                observable.onError(err)
            }, onCompleted: {
                observable.onCompleted()
            }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
    }
    
}
