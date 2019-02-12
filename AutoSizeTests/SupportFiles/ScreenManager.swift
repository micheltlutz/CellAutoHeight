//
//  ScreenManager.swift
//  AutoSizeTests
//
//  Created by Michel Anderson Lutz Teixeira on 12/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//
import UIKit

class ScreenManager {
    public static let shared = ScreenManager()

    public static let statusBarHeight = UIApplication.shared.statusBarFrame.height

    static func printScreenSizes() {
        print("WIDTH: \(UIScreen.main.bounds.width) \n", "HEIGHT: \(UIScreen.main.bounds.height) \n")
    }
    static func screenWidth() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    static func screenHeight(withStatusBar: Bool? = false) -> CGFloat {
        if withStatusBar != nil {
            return UIScreen.main.bounds.height + UIApplication.shared.statusBarFrame.height
        } else {
            return UIScreen.main.bounds.height
        }
    }

    static func getHeightFromWidth(width: Int) -> Int {
        switch width {
        case 375, 414:
            return 97
        case 750:
            return 174
        case 1125:
            return 431
        default:
            return 72
        }
    }

    static func getHeightFromWidth(width: CGFloat) -> CGFloat {
        switch width {
        case 375, 414:
            return 97
        case 750:
            return 174
        case 1125:
            return 431
        default:
            return 72
        }
    }
    var iPhoneX: Bool {
        return UIScreen.main.nativeBounds.height == 2436
    }
    var iPhone: Bool {
        return UIDevice.current.userInterfaceIdiom == .phone
    }
    enum ScreenType: String {
        case iPhones_4_4S = "iPhone 4 or iPhone 4S"
        case iPhones_5_5s_5c_SE = "iPhone 5, iPhone 5s, iPhone 5c or iPhone SE"
        case iPhones_6_6s_7_8 = "iPhone 6, iPhone 6S, iPhone 7 or iPhone 8"
        case iPhones_6Plus_6sPlus_7Plus_8Plus = "iPhone 6 Plus, iPhone 6S Plus, iPhone 7 Plus or iPhone 8 Plus"
        case iPhones_X_XS = "iPhone X or iPhone XS"
        case iPhone_XR = "iPhone XR"
        case iPhone_XSMax = "iPhone XS Max"
        case unknown
    }
    var screenType: ScreenType {
        switch UIScreen.main.nativeBounds.height {
        case 960:
            return .iPhones_4_4S
        case 1136:
            return .iPhones_5_5s_5c_SE
        case 1334:
            return .iPhones_6_6s_7_8
        case 1792:
            return .iPhone_XR
        case 1920, 2208:
            return .iPhones_6Plus_6sPlus_7Plus_8Plus
        case 2436:
            return .iPhones_X_XS
        case 2688:
            return .iPhone_XSMax
        default:
            return .unknown
        }
    }
}
