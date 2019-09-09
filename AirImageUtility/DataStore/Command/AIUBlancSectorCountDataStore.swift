//
//  AIUBlancSectorCountDataStore.swift
//  AirImageUtility
//
//  Created by MasamiYamate on 2019/09/09.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import Foundation

struct AIUBlancSectorCountDataStore {
    
    func request(callback: (((res: AIUBlancSectorCountDataModel?, err: Error?)) -> Void)?) {
        let sectorSize = AIUFlashAirCommandRequest.AIUBlancSectorCount()
        sectorSize.request(callback: {(res: String? , err: Error?) in
            if let err = err {
                callback?((res: nil, err: err))
                return
            }
            guard let response = res else {
                callback?((res: nil, err: nil))
                return
            }
            do {
                let model = try AIUBlancSectorCountDataModelTranslator().translate(with: response)
                callback?((res: model, err: nil))
            } catch {
                callback?((res: nil, err: error))
            }
        })
    }
    
}
