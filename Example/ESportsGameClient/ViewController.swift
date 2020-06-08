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
    ESportsGameClient.sharedInstance()?.launchMode = LaunchMode.usingPartnerMemberToken("testjust", publicToken: "13914810-df06-4adb-9838-f8e9668321e3")
    ESportsGameClient.sharedInstance()?.homeIcon = HomeIcon.back()
    ESportsGameClient.sharedInstance()?.theme = Theme.dark()
    ESportsGameClient.sharedInstance()?.accountName = "Justine"
    ESportsGameClient.show(self)
  }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ViewController: ESportsGameClientDelegate {
  func esportsGameClientPresentationController() -> UIViewController! {
    return self
  }
  
  func esportsGameClientAccountDidTapped() {
    let alertViewController = UIAlertController(title: "Account", message: nil, preferredStyle: .alert)
    alertViewController.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
    present(alertViewController, animated: true, completion: nil)
  }
}
