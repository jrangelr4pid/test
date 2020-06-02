//
//  ESportsGameClientManager.swift
//  ESportsGameClientMobile
//
//  Created by Justine Angelo Rangel on 4/30/20.
//  Copyright © 2020 R4pid Inc. All rights reserved.
//

import Foundation

struct Keys {
  static let publicTokenKey = "publicToken"
  static let partnerTokenKey = "partnerToken"
  static let gameLaunchTokenKey = "gameLaunchToken"
  static let accountNameKey = "accountName"
  static let homeIconKey = "homeIcon"
  static let themeKey  = "theme"
  
  private init() {
  }
}

@objc(ESportsGameClientManager)
class ESportsGameClientManager: NSObject {
  @objc(addEvent:location:date:)
  func addEvent(name: String, location: String, date: NSNumber) {
    print(#function)
    print("name ", name)
    print("location ", location)
    print("date ", date)
  }
  
  @objc
  func dismiss() {
    ESportsGameClient.dismiss()
  }
  
  @objc
  func accountTapped() {
    ESportsGameClient.accountTapped()
  }
  
  @objc
  func constantsToExport() -> [String: Any] {
    var constants: [String: Any] = [:]
    if let launchMode = ESportsGameClient.Config.launchMode {
      switch launchMode {
      case .usingPartnerMemberToken(let token, let publicToken):
        constants[Keys.partnerTokenKey] = token
        constants[Keys.publicTokenKey] = publicToken
      case .usingGameLaunchToken(let token, let publicToken):
        constants[Keys.gameLaunchTokenKey] = token
        constants[Keys.publicTokenKey] = publicToken
      }
    }
    if let homeIcon = ESportsGameClient.Config.homeIcon {
      switch homeIcon {
      case .default:
        constants[Keys.homeIconKey] = "default"
      case .back:
        constants[Keys.homeIconKey] = "back"
      case .custom(let image):
        constants[Keys.homeIconKey] = image
      }
    }
    if let theme = ESportsGameClient.Config.theme {
      switch theme {
      case .default:
        constants[Keys.themeKey] = "default"
      case .dark:
        constants[Keys.themeKey] = "dark"
      case .light:
        constants[Keys.themeKey] = "light"
      case .customJSON(let file):
        if let url = Bundle.main.url(forResource: file, withExtension: "json") {
          do {
            let data = try Data(contentsOf: url, options: .mappedIfSafe)
             constants[Keys.themeKey] = String(data: data, encoding: .utf8)
          } catch {
            print("Setting theme error: ", error.localizedDescription)
          }
        } else {
          fatalError("File: \(file) is set but not found. please make sure \(file) is properly included in your project")
        }
      }
    }
    constants[Keys.accountNameKey] = ESportsGameClient.Config.accountName
    return constants
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
}
