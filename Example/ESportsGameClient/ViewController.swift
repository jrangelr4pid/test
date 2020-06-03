//
//  ViewController.swift
//  ESportsGameClient
//
//  Created by jrangelr4pid on 05/19/2020.
//  Copyright (c) 2020 jrangelr4pid. All rights reserved.
//

import UIKit
import ESportsGameClient

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
   
    ESportsGameClient.Config.launchMode = .usingPartnerMemberToken(token: "testjust", publicToken: "13914810-df06-4adb-9838-f8e9668321e3")
    ESportsGameClient.Config.accountName = "Justine Rangel"
    ESportsGameClient.Config.theme = .light
//    ESportsGameClient.Config.theme = .customJSON(file: "test")
    ESportsGameClient.show(delegate: self)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


extension ViewController: ESportsGameClientDelegate {
  func esportsGameClientWillShow(_ controller: ESportsGameClientViewController) {
    print(#function)
  }
  
  func esportsGameClientDidShow(_ controller: ESportsGameClientViewController) {
    print(#function)
  }
  
  func esportsGameClientWillDismiss(_ controller: ESportsGameClientViewController) {
    print(#function)
  }
  
  func esportsGameClientDidDismiss(_ controller: ESportsGameClientViewController) {
    print(#function)
  }
  
  func esportsGameClientAccountTapped(_ controller: ESportsGameClientViewController) {
    print(#function)
  }
  
  func esportsGameClientPresentationController() -> UIViewController {
    return self
  }
}
