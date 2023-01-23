

import UIKit

enum iDevice {
    case iPhone5
    case iPhone5s
    case iPhone5c
    case iPhone6
    case iPhone6Plus
    case iPhone6s
    case iPhone6sPlus
    case iPhoneSE1
    case iPhone7
    case iPhone7Plus
    case iPhone8
    case iPhone8Plus
    case iPhoneX
    case iPhoneXS
    case iPhoneXSMax
    case iPhoneXR
    case iPhone11
    case iPhone11Pro
    case iPhone11ProMax
    case iPhoneSE2
    case iPhone12
    case iPhone12Mini
    case iPhone12Pro
    case iPhone12ProMax
    case iPhone13Mini
    case iPhone13
    case iPhone13Pro
    case iPhone13ProMax
    case iPad4
    case iPad5
    case iPad6
    case iPad7
    case iPadAir1
    case iPadAir2
    case iPadAir3
    case iPadMini2
    case iPadMini3
    case iPadMini4
    case iPadMini5
    case iPadPro9Gen1
    case iPadPro12Gen1
    case iPadPro10Gen2
    case iPadPro12Gen2
    case iPadPro11Gen3
    case iPadPro12Gen3
    case iPadPro11Gen4
    case iPadPro12Gen4
    case iPodTouch6
    case iPodTouch7
    
    var width: CGFloat {
        get {
            switch self {
            case .iPhone5, .iPhone5s, .iPhone5c, .iPhoneSE1, .iPodTouch6, .iPodTouch7:
                return 320
            case .iPhone12Mini:
                return 360
            case .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneX, .iPhoneXS, .iPhone11Pro, .iPhoneSE2, .iPhone13Mini:
                return 375
            case .iPhone12, .iPhone12Pro, .iPhone13, .iPhone13Pro:
                return 390
            case .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus, .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11ProMax:
                return 414
            case .iPhone12ProMax, .iPhone13ProMax:
                return 428
            case .iPad4, .iPad5, .iPad6, .iPadAir1, .iPadAir2, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadPro9Gen1:
                return 768
            case .iPad7:
                return 810
            case .iPadPro10Gen2, .iPadPro11Gen3, .iPadAir3, .iPadPro11Gen4:
                return 834
            case .iPadPro12Gen1, .iPadPro12Gen2, .iPadPro12Gen3, .iPadPro12Gen4:
                return 1024
            }
        }
    }
    
    var height: CGFloat {
        get {
            switch self {
            case .iPhone5, .iPhone5s, .iPhone5c, .iPhoneSE1, .iPodTouch6, .iPodTouch7:
                return 568
            case .iPhone6, .iPhone6s, .iPhone7, .iPhone8, .iPhoneSE2:
                return 667
            case .iPhone6Plus, .iPhone6sPlus, .iPhone7Plus, .iPhone8Plus:
                return 736
            case .iPhone12Mini:
                return 780
            case .iPhoneX, .iPhoneXS, .iPhone11Pro, .iPhone13Mini:
                return 812
            case .iPhone12, .iPhone12Pro, .iPhone13, .iPhone13Pro:
                return 844
            case .iPhoneXSMax, .iPhoneXR, .iPhone11, .iPhone11ProMax:
                return 896
            case .iPhone12ProMax:
                return 926
            case .iPad4, .iPad5, .iPad6, .iPadAir1, .iPadAir2, .iPadMini2, .iPadMini3, .iPadMini4, .iPadMini5, .iPadPro9Gen1, .iPhone13ProMax:
                return 1024
            case .iPad7:
                return 1080
            case .iPadPro10Gen2, .iPadAir3:
                return 1112
            case .iPadPro11Gen3, .iPadPro11Gen4:
                return 1194
            case .iPadPro12Gen1, .iPadPro12Gen2, .iPadPro12Gen3, .iPadPro12Gen4:
                return 1366
            }
        }
    }
}
