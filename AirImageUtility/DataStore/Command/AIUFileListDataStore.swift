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
    
    func request() -> Observable<String> {
        let searchQuery: String = searchPath ?? "/"
        let fileList = AIUFlashAirCommandRequest.AIUFileList(parameter: searchQuery)
        return fileList.request()
    }
    
}
