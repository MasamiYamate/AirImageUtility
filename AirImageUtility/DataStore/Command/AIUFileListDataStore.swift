//
//  AIUFileListDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/08/28.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUFileListDataStore {
    
    let searchPath: String?
    
    func request(callback: (((res: [AIUFilePathDataModel]?, err: Error?)) -> Void)?) {
        let searchQuery: String = searchPath ?? "/"
        let fileList = AIUFlashAirCommandRequest.AIUFileList(parameter: searchQuery)
        fileList.request(callback: {(res: String? , err: Error?) in
            
        })
    }
    
}
