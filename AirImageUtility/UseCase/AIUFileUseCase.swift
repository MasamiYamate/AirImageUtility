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
    
    /// 任意のDirectory直下のファイルリストを取得します
    ///
    /// - Parameter searchPath: 任意のDirectoryのパス
    /// - Returns: FileList
    func fileList(with searchPath: String?) -> Observable<[AIUFilePathDataModel]> {
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
    
    /// 任意のパスより下の階層のDirectory以外のファイルを取得する
    ///
    /// - Parameter searchPath: 任意のDirectoryのパス
    /// - Returns: Filelist
    func dataFileList(with searchPath: String?) -> Observable<[AIUFilePathDataModel]> {
        return Observable<[AIUFilePathDataModel]>.create { observable in
            var tmpPaths = self.syncFileList(with: searchPath)
            var dataFilePaths = [AIUFilePathDataModel]()
            while tmpPaths.count != 0 {
                for _ in 0..<tmpPaths.count {
                    if let tmpPath = tmpPaths.first {
                        tmpPaths.removeFirst()
                        if tmpPath.attribute == .directory {
                            tmpPaths += self.syncFileList(with: tmpPath.directoryName)
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
    
    /// Thumbnail用Dataを取得する
    ///
    /// - Parameter filePath: Thumbnailを取得したいファイルのパス
    /// - Returns: Data Thumbnailのデータ
    func thumbnail(with filePath: String) -> Observable<Data> {
        return AIUThumbnailDataStore(filePath: filePath).request()
    }
    
    /// オリジナルデータを取得する
    ///
    /// - Parameter filePath: オリジナルデータを取得したいファイルのパス
    /// - Returns: Data オリジナルデータ
    func data(with filePath: String) -> Observable<Data> {
        return AIUFileDataStore(filePath: filePath).request()
    }
    
    /// 任意のDirectory直下のファイル件数を取得します
    ///
    /// - Parameter searchPath: 検索したいDirectoryのパス
    /// - Returns: Int ファイルの総数
    func count(with searchPath: String?) -> Observable<Int> {
        return AIUFileCountDataStore(searchPath: searchPath).request()
    }
    
}

private extension AIUFileUseCase {
    
    func syncFileList(with searchPath: String?) -> [AIUFilePathDataModel] {
        let semaphore = DispatchSemaphore(value: 0)
        var result = [AIUFilePathDataModel]()
        fileList(with: searchPath).subscribe(onNext: {value in
            result = value
            semaphore.signal()
        }).disposed(by: disposeBag)
        
        semaphore.wait()
        return result
    }
    
}
