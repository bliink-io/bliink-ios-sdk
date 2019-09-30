//
//  Mocks.swift
//  BliinkSdk
//
//  Created by DAMS Saber on 03/09/2019.
//  Copyright © 2019 DAMS Saber. All rights reserved.
//

import Foundation

struct Utils {
    static var shared = Utils()
    class Sample {
    }
    public func setPreference(){
        let preferences = UserDefaults.standard
        preferences.set(Constants.IAB.EXAMPLE_STRING.rawValue, forKey: Constants.IAB.CONSENT_STRING.rawValue)
        preferences.set(true, forKey: Constants.IAB.HAS_CONSENT_STRING.rawValue)
        let didSave = preferences.synchronize()
        
        if !didSave {
            print("Error save preferences")
        }
    }

}
