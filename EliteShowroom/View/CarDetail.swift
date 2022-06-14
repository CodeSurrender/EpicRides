//
//  CarDetail.swift
//  EliteShowroom
//
//  Created by Cole on 09/06/2022.
//  Copyright © 2022 Cole. All rights reserved.
//

import UIKit
import Foundation

class CarDetail: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nasaMedia(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 100), title: "nasaMedia")
        return cell
    }
}
