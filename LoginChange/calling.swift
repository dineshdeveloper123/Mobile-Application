//
//  calling.swift
//  LoginChange
//
//  Created by Rifluxyss on 26/09/24.
//

import Foundation
import CallKit

@available(iOS 14.0, *)
class calling:NSObject, CXProviderDelegate{
    func providerDidReset(_ provider: CXProvider) {
        
    }
    
    let provider = CXProvider(configuration: CXProviderConfiguration())
    let callController = CXCallController()
    
    override init() {
        super.init()
        provider.setDelegate(self, queue: nil)
    }
    
    func StartCall(id:UUID, handle:String){
        let handle = CXHandle(type: .generic, value: handle)
        let action = CXStartCallAction(call: id, handle: handle)
        let transaction = CXTransaction(action: action)
        callController.request(transaction){error in
            if let error = error{
                print(String(describing: error))
            }else{
                print("call started")
            }
        }
    }
}
