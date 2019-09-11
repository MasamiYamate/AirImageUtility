//
//  AIUFileListDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/28.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFileListDataStore {
    
    let searchPath: String?
    
    private let disposeBag = DisposeBag()
    
    func request() -> Observable<[AIUFilePathDataModel]> {
        let searchQuery: String = searchPath ?? "/"
        let fileList = AIUFlashAirCommandRequest.AIUFileList(parameter: searchQuery)
        
        return Observable<[AIUFilePathDataModel]>.create { observable in
            let fileListObservable = fileList.request()
            fileListObservable.subscribe(onNext: { res in
                let models = AIUFilePathDataModelTranslator().translate(with: res)
                observable.onNext(models)
                observable.onCompleted()
            }, onError: { err in
                observable.onError(err)
            }, onCompleted: {
                observable.onCompleted()
            }).disposed(by: self.disposeBag)
            return Disposables.create()
        }
        
    }
    
}
