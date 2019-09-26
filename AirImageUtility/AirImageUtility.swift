//
//  AirImageUtility.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class AirImageUtility {
    
    private let disposeBag = DisposeBag()
    
    // MARK: ファイル操作関連
    
    /// ファイルリストを取得します
    /// - Parameter path: 検索したいファイルのパス
    /// - Parameter callback: ファイルリスト
    func fileList (with path: String?, callback: ((Result<[AIUFilePathDataModel], Error>) -> Void)?) {
        let fileList = AIUFileUseCase().fileList(with: path)
        fileList.subscribe(onNext: { value in
            callback?(.success(value))
        }, onError: { err in
            callback?(.failure(err))
        }).disposed(by: disposeBag)
    }
    
    /// SDカード内のディレクトリ以外のファイルを取得する
    /// - Parameter path: 検索したいファイルのパス
    /// - Parameter callback: ディレクトリ以外のファイルパス
    func dataFileList(with path: String?, callback: ((Result<[AIUFilePathDataModel], Error>) -> Void)?) {
        let dataFileList = AIUFileUseCase().dataFileList(with: path)
        dataFileList.subscribe(onNext: { value in
            callback?(.success(value))
        }, onError: { err in
            callback?(.failure(err))
        }).disposed(by: disposeBag)
    }
    

}
