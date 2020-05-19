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
    constants[Keys.accountNameKey] = ESportsGameClient.Config.accountName
    return constants
  }
  
  @objc
  static func requiresMainQueueSetup() -> Bool {
    return false
  }
}
