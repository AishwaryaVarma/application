//
//  TabBarViewController.swift
//  CHMeetupApp
//
//  Created by Alexander Zimin on 22/02/2017.
//  Copyright © 2017 CocoaHeads Comunity. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
  let remoteRequests: RemoteProtocol = RemoteService()
  override func viewDidLoad() {
    super.viewDidLoad()

    // Query example

    Server.request(UserPO.Requests.list) { (users) in
      for user in users! {
        print(user)
      }
    }
    
    
    //
    //    do {
    //      try remoteRequests.load(.users) { json in
    //        let users = json.flatMap(UserPO.init)
    //        for user in users {
    //          print(user.name)
    //          print(user.remoteID)
    //        }
    //      }
    //    } catch {
    //      print("Remote loading error: \(error) for resourse: \(API.users)")
    //    }
  }
}
