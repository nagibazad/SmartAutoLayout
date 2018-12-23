//
//  UIDeviceExt.swift
//
//  Created by Nagib Bin Azad on 22/12/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

import Foundation

public enum Model : String {
    case simulator   = "simulator/sandbox",
    iPhone4S         = "iPod 1,2,3,4,iPhone 4,iPhone 4S",
    iPhoneSE         = "iPod 5,iPhone 5,5S,5C,SE",
    iPad7_9          = "iPad Mini 1,iPad Mini 2,iPad Mini 3",
    iPadPro9_7       = "iPad Air 1,iPad Air 2,iPad Pro 9.7\",iPad Pro 9.7\" cellular",
    iPadPro10_5      = "iPad Pro 10.5\",iPad Pro 10.5\" cellular",
    iPadPro12_9      = "iPad Pro 12.9\", iPad Pro 12.9\" cellular",
    iPhone8          = "iPhone 6,6S,7,8",
    iPhone8plus      = "iPhone 6 Plus,6S Plus,7 Plus,8 Plus",
    iPhoneXS         = "iPhone X, iPhone XS",
    iPhoneXSmax      = "iPhone XS Max",
    iPhoneXR         = "iPhone XR",
    unrecognized     = "?unrecognized?"
}

public extension UIDevice {
    
    public var type: Model {
        var systemInfo = utsname()
        uname(&systemInfo)
        let modelCode = withUnsafePointer(to: &systemInfo.machine) {
            $0.withMemoryRebound(to: CChar.self, capacity: 1) {
                ptr in String.init(validatingUTF8: ptr)
                
            }
        }
        var modelMap : [ String : Model ] = [
            "i386"       : .simulator,
            "x86_64"     : .simulator,
            "iPod1,1"    : .iPhone4S,
            "iPod2,1"    : .iPhone4S,
            "iPod3,1"    : .iPhone4S,
            "iPod4,1"    : .iPhone4S,
            "iPod5,1"    : .iPhoneSE,
            "iPad2,1"    : .iPadPro9_7,
            "iPad2,2"    : .iPadPro9_7,
            "iPad2,3"    : .iPadPro9_7,
            "iPad2,4"    : .iPadPro9_7,
            "iPad2,5"    : .iPad7_9,
            "iPad2,6"    : .iPad7_9,
            "iPad2,7"    : .iPad7_9,
            "iPhone3,1"  : .iPhone4S,
            "iPhone3,2"  : .iPhone4S,
            "iPhone3,3"  : .iPhone4S,
            "iPhone4,1"  : .iPhone4S,
            "iPhone5,1"  : .iPhoneSE,
            "iPhone5,2"  : .iPhoneSE,
            "iPhone5,3"  : .iPhoneSE,
            "iPhone5,4"  : .iPhoneSE,
            "iPad3,1"    : .iPadPro9_7,
            "iPad3,2"    : .iPadPro9_7,
            "iPad3,3"    : .iPadPro9_7,
            "iPad3,4"    : .iPadPro9_7,
            "iPad3,5"    : .iPadPro9_7,
            "iPad3,6"    : .iPadPro9_7,
            "iPhone6,1"  : .iPhoneSE,
            "iPhone6,2"  : .iPhoneSE,
            "iPad4,1"    : .iPadPro9_7,
            "iPad4,2"    : .iPadPro9_7,
            "iPad4,4"    : .iPad7_9,
            "iPad4,5"    : .iPad7_9,
            "iPad4,6"    : .iPad7_9,
            "iPad4,7"    : .iPad7_9,
            "iPad4,8"    : .iPad7_9,
            "iPad4,9"    : .iPad7_9,
            "iPad6,3"    : .iPadPro9_7,
            "iPad6,11"   : .iPadPro9_7,
            "iPad6,4"    : .iPadPro9_7,
            "iPad6,12"   : .iPadPro9_7,
            "iPad6,7"    : .iPadPro12_9,
            "iPad6,8"    : .iPadPro12_9,
            "iPad7,3"    : .iPadPro10_5,
            "iPad7,4"    : .iPadPro10_5,
            "iPhone7,1"  : .iPhone8plus,
            "iPhone7,2"  : .iPhone8,
            "iPhone8,1"  : .iPhone8,
            "iPhone8,2"  : .iPhone8plus,
            "iPhone8,4"  : .iPhoneSE,
            "iPhone9,1"  : .iPhone8,
            "iPhone9,2"  : .iPhone8plus,
            "iPhone9,3"  : .iPhone8,
            "iPhone9,4"  : .iPhone8plus,
            "iPhone10,1" : .iPhone8,
            "iPhone10,2" : .iPhone8plus,
            "iPhone10,3" : .iPhoneXS,
            "iPhone10,4" : .iPhone8,
            "iPhone10,5" : .iPhone8plus,
            "iPhone10,6" : .iPhoneXS,
            "iPhone11,2" : .iPhoneXS,
            "iPhone11,4" : .iPhoneXSmax,
            "iPhone11,6" : .iPhoneXSmax,
            "iPhone11,8" : .iPhoneXR
        ]
        
        if let model = modelMap[String.init(validatingUTF8: modelCode!)!] {
            if model == .simulator {
                if let simModelCode = ProcessInfo().environment["SIMULATOR_MODEL_IDENTIFIER"] {
                    if let simModel = modelMap[String.init(validatingUTF8: simModelCode)!] {
                        return simModel
                    }
                }
            }
            return model
        }
        return Model.unrecognized
    }
}
