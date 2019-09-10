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
    
    func request() -> [AIUFilePathDataModel] {
        let searchQuery: String = searchPath ?? "/"
        let fileList = AIUFlashAirCommandRequest.AIUFileList(parameter: searchQuery)
        fileList.request()
        fileList.request(callback: {(res: String? , err: Error?) in
            if err != nil {
                callback?((res: nil, err: err))
                return
            }
            let response = AIUFilePathDataModelTranslator().translate(with: res!)
            
            callback?((res: response, err: err))
        })
    }
    
}
