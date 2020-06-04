//
//  ESportsGameClientViewController.swift
//  ESportsGameClientMobile
//
//  Created by Justine Angelo Rangel on 4/29/20.
//  Copyright © 2020 Facebook. All rights reserved.
//

import Foundation
import UIKit
import React
import UMReactNativeAdapter

public class ESportsGameClientViewController: UIViewController {
  private lazy var registryAdapter: UMModuleRegistryAdapter = {
    let registryProvider = UMModuleRegistryProvider()
    return UMModuleRegistryAdapter(moduleRegistryProvider: registryProvider)
  }()
  
  private var bridge: RCTBridge?
  
  public override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    
    bridge = initializeReactNativeApp()
  }
  
  public override func viewWillDisappear(_ animated: Bool) {
    super.viewWillDisappear(animated)
    
    bridge?.invalidate()
    bridge = nil
  }
  
  deinit {
    print("deinit ESportsGameClientViewController")
  }
  
  @discardableResult
  private func initializeReactNativeApp() -> RCTBridge? {
    guard let bridge = RCTBridge(delegate: self, launchOptions: nil) else { return nil }
    let rootView = RCTRootView(bridge: bridge, moduleName: "main", initialProperties: ESportsGameClient.Config.initialProperties)
    rootView.frame = view.frame
    view.addSubview(rootView)
    return bridge
  }
}

// MARK: - RCTBridgeDelegate
extension ESportsGameClientViewController: RCTBridgeDelegate {
  public func sourceURL(for bridge: RCTBridge!) -> URL! {
    return RCTBundleURLProvider.sharedSettings()?.jsBundleURL(forBundleRoot: "index", fallbackResource: nil) //use for network
//    return Bundle(url: Bundle(for: Self.self).resourceURL!)?.url(forResource: "main", withExtension: "jsbundle") //use for file
  }
  
  public func extraModules(for bridge: RCTBridge!) -> [RCTBridgeModule]! {
    let extraModules = registryAdapter.extraModules(for: bridge)
    // You can inject any extra modules that you would like here, more information at:
    // https://facebook.github.io/react-native/docs/native-modules-ios.html#dependency-injection
    return extraModules
  }
}
