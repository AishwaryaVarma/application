//
//  MapsController.swift
//  MapsPlayground
//
//  Created by Alexander Zimin on 23/02/2017.
//  Copyright © 2017 CocoaHeads Comunity. All rights reserved.
//

import UIKit
import CoreLocation

struct MapsController {
  static var avalableMaps: [MapAppType] {
    return MapAppType.allMaps.filter({
      map in
      return UIApplication.shared.canOpenURL(map.scheme)
    })
  }
  
  static func open(map: MapAppType, coordinate: CLLocationCoordinate2D) {
    let schemeURL = map.scheme(with: coordinate)
    UIApplication.shared.open(schemeURL, options: [:], completionHandler: nil)
  }
}
