//
//  Makes.swift
//  EliteShowroom
//
//  Created by Cole on 09/06/2022.
//  Copyright © 2022 Cole. All rights reserved.
//

import UIKit
import Foundation


let parser = nasaParser()
let parser2 = nasaParser2()
let parser3 = nasaParser3()
let parser4 = nasaParser4()
let parser5 = nasaParser5()

class Makes: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nasaMedia(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 100), title: "nasaMedia")
        return cell
    }
}


// Cell class
class nasaMedia: UITableViewCell {
    
    var nasaimageView: UIImageView!
    var nasatitle: UILabel!
    var photographer: UILabel!
    var date: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "nasaDetail")
        
        nasaimageView = UIImageView(frame: CGRect(x: 20,y: 10,width: 80,height: 80))
        nasaimageView.backgroundColor = UIColor.lightGray
        nasatitle = UILabel(frame: CGRect(x: 120,y: 10,width: 250,height: 25))
        nasatitle.font = UIFont.boldSystemFont(ofSize: 18)
        nasatitle.numberOfLines = 0
        date = UILabel(frame: CGRect(x: 120,y: 35,width: 250,height: 50))
        date.contentMode = .left
        addSubview(nasaimageView)
        addSubview(nasatitle)
        addSubview(date)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}

class makeMedia: UITableViewCell {
    
    var nasaimageView: UIImageView!
    var nasatitle: UILabel!
    var photographer: UILabel!
    var date: UILabel!
    
    init(frame: CGRect, title: String) {
        super.init(style: UITableViewCell.CellStyle.default, reuseIdentifier: "nasaDetail")
        
        nasaimageView = UIImageView(frame: CGRect(x: 20,y: 10,width: 80,height: 80))
        nasatitle = UILabel(frame: CGRect(x: 150,y: 35,width: 250,height: 25))
        nasatitle.font = UIFont.boldSystemFont(ofSize: 18)
        nasatitle.numberOfLines = 0
        date = UILabel(frame: CGRect(x: 140,y: 35,width: 250,height: 50))
        date.contentMode = .left
        addSubview(nasaimageView)
        addSubview(nasatitle)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
}
