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
    
    private let translator = AIUFilePathDataModelTranslator()
    
    private let disposeBag = DisposeBag()
    
    /// 任意のDirectory直下のファイルリストを取得します
    ///
    /// - Parameter searchPath: 任意のDirectoryのパス
    /// - Returns: FileList
    func fileList(with searchPath: String = "/") -> Observable<[AIUFilePathDataModel]> {
        let fileList = AIUFileListDataStore.init(searchPath: searchPath)
        
        return AIUFileListDataStore(searchPath: searchPath)
            .request()
            .flatMap({ result -> Observable<[AIUFilePathDataModel]> in
                return .just(translator.translate(with: result, query: searchPath))
            })
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
