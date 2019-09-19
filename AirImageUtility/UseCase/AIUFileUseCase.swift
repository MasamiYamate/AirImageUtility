//
//  AIUFileUseCase.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/18.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct AIUFileUseCase {
    
    private let disposeBag = DisposeBag()
    
    func fileList(by searchPath: String?) -> Observable<[AIUFilePathDataModel]> {
        let searchQuery: String = searchPath ?? "/"
        let fileList = AIUFileListDataStore.init(searchPath: searchQuery)
        
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
    
    func dataFileList(by searchPath: String?) -> Observable<[AIUFilePathDataModel]> {
        return Observable<[AIUFilePathDataModel]>.create { observable in
            var tmpPaths = self.syncFileList(by: searchPath)
            var dataFilePaths = [AIUFilePathDataModel]()
            while tmpPaths.count != 0 {
                for _ in 0..<tmpPaths.count {
                    if let tmpPath = tmpPaths.first {
                        tmpPaths.removeFirst()
                        if tmpPath.attribute == .directory {
                            tmpPaths.append(tmpPath)
                        } else {
                            dataFilePaths.append(tmpPath)
                        }
                    }
                }
            }
            observable.onNext(dataFilePaths)
            return Disposables.create()
        }
    }
    
    func thumbnail(by filePath: String) -> Observable<Data> {
        return AIUThumbnailDataStore(filePath: filePath).request()
    }
    
    func count(by searchPath: String?) -> Observable<Int> {
        return AIUFileCountDataStore(searchPath: searchPath).request()
    }
    
}

private extension AIUFileUseCase {
    
    func syncFileList(by searchPath: String?) -> [AIUFilePathDataModel] {
        let semaphore = DispatchSemaphore(value: 0)
        var result = [AIUFilePathDataModel]()
        fileList(by: searchPath).subscribe(onNext: {value in
            result = value
            semaphore.signal()
        }).disposed(by: disposeBag)
        
        semaphore.wait()
        return result
    }
    
}
