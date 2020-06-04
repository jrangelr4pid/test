//
//  ESportsGameClient.swift
//  ESportsGameClientMobile
//
//  Created by Justine Angelo Rangel on 4/30/20.
//  Copyright © 2020 R4pid Inc. All rights reserved.
//

import Foundation
import UIKit

public protocol ESportsGameClientDelegate: class {
  func esportsGameClientWillShow(_ controller: ESportsGameClientViewController)
  func esportsGameClientDidShow(_ controller: ESportsGameClientViewController)
  func esportsGameClientWillDismiss(_ controller: ESportsGameClientViewController)
  func esportsGameClientDidDismiss(_ controller: ESportsGameClientViewController)
  func esportsGameClientAccountTapped(_ controller: ESportsGameClientViewController)
  func esportsGameClientPresentationController() -> UIViewController
}

extension String {
  static var mainStory: String {
    return "Main"
  }
}

extension Bundle {
  static var thisBundle: Bundle {
    return Bundle(for: Self.self)
  }
}

public struct ESportsGameClient {
  public enum LaunchMode {
    case usingPartnerMemberToken(token: String, publicToken: String)
    case usingGameLaunchToken(token: String, publicToken: String)
  }
  
  public enum HomeIcon {
    case `default`
    case back
    /// custom icon url for home icon
    case custom(url: String)
  }
  
  public enum Theme {
    case `default`
    case dark
    case light
    /// custom json file; must follow proper format and included on your project to work
    case customJSON(file: String)
  }
  
  public struct Config {
    /// This is required
    public static var launchMode: LaunchMode?
    /// Fill up this config to enable account management
    public static var accountName: String?
    /// Set  default image
    public static var homeIcon: HomeIcon?
    /// Set  default theme
    public static var theme: Theme?
    
    public static fileprivate(set) var initialProperties: [AnyHashable: Any]?
  }
  
  public static func runTingYun() {
    TinyunBridge.registerAppID("1a1cecbe1647416ca0039d5b51b303a5", crashReport: false)
    TinyunBridge.setUserIdentifier("test_jus")
  }
  
  private static var esportsGameClientViewController: ESportsGameClientViewController?
  private static weak var delegate: ESportsGameClientDelegate?
  
  public static func show(initialProperties: [AnyHashable: Any]? = nil, delegate: ESportsGameClientDelegate? = nil) {
    Config.initialProperties = initialProperties
    self.delegate = delegate
    guard Config.launchMode != nil else {
      fatalError("Launch mode must be set to continue.")
    }
    guard let presenterController = delegate?.esportsGameClientPresentationController() ?? UIApplication.shared.topViewController() else {
      fatalError("Presenter controller could not be loaded.")
    }
    guard esportsGameClientViewController == nil else {
      print("ESportsGameClient is already loaded.")
      return
    }
    
    esportsGameClientViewController = ESportsGameClientViewController()
    esportsGameClientViewController!.modalPresentationStyle = .fullScreen
    delegate?.esportsGameClientWillShow(esportsGameClientViewController!)
    presenterController.present(esportsGameClientViewController!, animated: true) {
      delegate?.esportsGameClientDidShow(self.esportsGameClientViewController!)
    }
  }
  
  public static func dismiss() {
    guard let esportsGameClientViewController = esportsGameClientViewController else { return }
    DispatchQueue.main.async {
      self.delegate?.esportsGameClientWillDismiss(esportsGameClientViewController)
      esportsGameClientViewController.dismiss(animated: true) {
        self.delegate?.esportsGameClientDidDismiss(esportsGameClientViewController)
        self.esportsGameClientViewController = nil
      }
    }
  }
  
  internal static func accountTapped() {
    guard let esportsGameClientViewController = esportsGameClientViewController else { return }
    DispatchQueue.main.async {
      if let presentedViewController = esportsGameClientViewController.presentedViewController {
        presentedViewController.dismiss(animated: true) {
          self.delegate?.esportsGameClientWillDismiss(esportsGameClientViewController)
          esportsGameClientViewController.dismiss(animated: true) {
            self.delegate?.esportsGameClientDidDismiss(esportsGameClientViewController)
            self.delegate?.esportsGameClientAccountTapped(esportsGameClientViewController)
            self.esportsGameClientViewController = nil
          }
        }
      } else {
        self.delegate?.esportsGameClientWillDismiss(esportsGameClientViewController)
        esportsGameClientViewController.dismiss(animated: true) {
          self.delegate?.esportsGameClientDidDismiss(esportsGameClientViewController)
          self.delegate?.esportsGameClientAccountTapped(esportsGameClientViewController)
          self.esportsGameClientViewController = nil
        }
      }
    }
  }
}

extension UIApplication {
  internal func topViewController(_ viewController: UIViewController? = UIApplication.shared.rootViewController()) -> UIViewController? {
    if let navigationController = viewController as? UINavigationController {
      return topViewController(navigationController.visibleViewController)
    }
    if let tabBarController = viewController as? UITabBarController {
      if let selectedViewController = tabBarController.selectedViewController {
        return topViewController(selectedViewController)
      }
    }
    if let presentedViewController = viewController?.presentedViewController {
      return topViewController(presentedViewController)
    }
    return viewController
  }
  
  internal func rootViewController() -> UIViewController? {
    return UIApplication.shared.keyWindow?.rootViewController?.presentedViewController ?? UIApplication.shared.keyWindow?.rootViewController
  }
}
