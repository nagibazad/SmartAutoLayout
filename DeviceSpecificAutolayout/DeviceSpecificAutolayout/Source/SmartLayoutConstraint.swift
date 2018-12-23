//
//  SmartLayoutConstraint.swift
//
//  Created by Nagib Bin Azad on 22/12/18.
//  Copyright © 2018 Nagib Bin Azad. All rights reserved.
//

import UIKit

class SmartLayoutConstraint: NSLayoutConstraint {

    @IBInspectable open var iPhone4S: Bool {
        didSet{
            if iPhone4S == false {
                self.devicesToIgnore.append(.iPhone4S)
            }
        }
    }
    
    @IBInspectable open var iPhoneSE: Bool {
        didSet{
            if iPhoneSE == false {
                self.devicesToIgnore.append(.iPhoneSE)
            }
        }
    }
    
    @IBInspectable open var iPhone8: Bool {
        didSet{
            if iPhone8 == false {
                self.devicesToIgnore.append(.iPhone8)
            }
        }
    }
    
    @IBInspectable open var iPhone8plus: Bool {
        didSet{
            if iPhone8plus == false {
                self.devicesToIgnore.append(.iPhone8plus)
            }
        }
    }
    
    @IBInspectable open var iPhoneXS: Bool {
        didSet{
            if iPhoneXS == false {
                self.devicesToIgnore.append(.iPhoneXS)
            }
        }
    }
    
    @IBInspectable open var iPhoneXS_max: Bool {
        didSet{
            if iPhoneXS_max == false {
                self.devicesToIgnore.append(.iPhoneXSmax)
            }
        }
    }
    
    @IBInspectable open var iPhoneXR: Bool {
        didSet{
            if iPhoneXR == false {
                self.devicesToIgnore.append(.iPhoneXR)
            }
        }
    }
    
    @IBInspectable open var iPad_7_9: Bool {
        didSet{
            if iPad_7_9 == false {
               self.devicesToIgnore.append(.iPad7_9)
            }
        }
    }
    
    @IBInspectable open var iPadPro_9_7: Bool {
        didSet{
            if iPadPro_9_7 == false {
                self.devicesToIgnore.append(.iPadPro9_7)
            }
        }
    }
    
    @IBInspectable open var iPadPro_10_5: Bool {
        didSet{
            if iPadPro_10_5 == false {
               self.devicesToIgnore.append(.iPadPro10_5)
            }
        }
    }
    
    @IBInspectable open var iPadPro_12_9: Bool {
        didSet{
            if iPadPro_12_9 == false {
                self.devicesToIgnore.append(.iPadPro12_9)
            }
        }
    }
    
    private var devicesToIgnore: [Model] {
        didSet{
            if devicesToIgnore.contains(UIDevice().type) == true {
                self.isActive = false
            }else {
                self.isActive = true
            }
        }
    }
    
    override init() {
        iPhone4S         = true
        iPhoneSE         = true
        iPad_7_9          = true
        iPadPro_9_7       = true
        iPadPro_10_5      = true
        iPadPro_12_9      = true
        iPhone8          = true
        iPhone8plus      = true
        iPhoneXS         = true
        iPhoneXS_max      = true
        iPhoneXR         = true
        devicesToIgnore = [Model]();
        super.init()
    }
    
    required init(coder decoder: NSCoder) {
        iPhone4S         = true
        iPhoneSE         = true
        iPad_7_9          = true
        iPadPro_9_7       = true
        iPadPro_10_5      = true
        iPadPro_12_9      = true
        iPhone8          = true
        iPhone8plus      = true
        iPhoneXS         = true
        iPhoneXS_max      = true
        iPhoneXR         = true
        devicesToIgnore = [Model]();
        super.init(coder: decoder)!
    }
}
