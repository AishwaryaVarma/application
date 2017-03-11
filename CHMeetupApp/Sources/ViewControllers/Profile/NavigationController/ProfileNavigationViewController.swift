//
//  ProfileNavigationViewController.swift
//  CHMeetupApp
//
//  Created by Alexander Zimin on 23/02/2017.
//  Copyright © 2017 CocoaHeads Community. All rights reserved.
//

import UIKit

protocol ProfileNavigationControllerType {
  func updateRootViewController()
}

class ProfileNavigationViewController: NavigationViewController, ProfileNavigationControllerType {

  override func viewDidLoad() {
    super.viewDidLoad()

    updateRootViewController()
    // Do any additional setup after loading the view.
  }

  func updateRootViewController() {
    if LoginProcessController.isLogin {
      self.viewControllers = [ViewControllersFactory.profileViewController]
    } else {
      self.viewControllers = [ViewControllersFactory.authViewController]
    }
  }

  override func customTabBarItemContentView() -> CustomTabBarItemView {
    return TabBarItemView.create(with: .profile)
  }

}
