//
//  Utils.swift
//  pizza-delivery
//
//  Created by Alexandru Corut on 09/06/2018.
//  Copyright © 2018 Alexandru Corut. All rights reserved.
//

import UIKit

class Utils {
    
    static var hasSafeArea: Bool {
        guard #available(iOS 11.0, *), let topPadding = UIApplication.shared.keyWindow?.safeAreaInsets.top, topPadding > 20 else {
            return false
        }
        return true
    }
    
    static func promptUserForReview() {
        #if DEBUG
        print("requesting review")
        #else
        SKStoreReviewController.requestReview()
        #endif
    }
    
    static func call(phoneNumber:String) {
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: convertToUIApplicationOpenExternalURLOptionsKeyDictionary([:]), completionHandler: nil)
            }
        }
    }
    
//    static func getOwnerName() -> String {
//        return "© spaceapps.io"
//    }
    
//    static func getDisplayName() -> String {
//        guard let name = Bundle.main.displayName else { return ""}
//        return name.capitalized.replacingOccurrences(of: "-", with: " ")
//    }
//
//    static func getDisplayVersion() -> String {
//        guard let version = Bundle.main.displayVersion else { return ""}
//        return version
//    }
    
    
    
    
}
fileprivate func convertToUIApplicationOpenExternalURLOptionsKeyDictionary(_ input: [String: Any]) -> [UIApplication.OpenExternalURLOptionsKey: Any] {
    return Dictionary(uniqueKeysWithValues: input.map { key, value in (UIApplication.OpenExternalURLOptionsKey(rawValue: key), value)})
}


//extension Bundle {
//
//    var displayName: String? {
//        return object(forInfoDictionaryKey: "CFBundleDisplayName") as? String ??
//            object(forInfoDictionaryKey: "CFBundleName") as? String
//    }
//
//    var displayVersion: String? {
//        return object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
//    }
//}
