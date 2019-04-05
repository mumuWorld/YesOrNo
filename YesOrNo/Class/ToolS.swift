//
//  ToolS.swift
//  YesOrNo
//
//  Created by mumu on 2019/4/5.
//  Copyright © 2019年 Mumu. All rights reserved.
//

import UIKit

struct Tools {
    static func isNeedShowHelp() -> Bool {
        if let user = UserDefaults.standard.object(forKey: "isNeedShowHelp") as? Bool {
           return user
        }
        return true
    }
    
    static func setNeedShowHelp(bool:Bool) -> Void {
        let user = UserDefaults.standard
        user.set(bool, forKey: "isNeedShowHelp")
        user.synchronize()
    }
}
