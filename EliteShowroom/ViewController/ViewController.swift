//
//  ViewController.swift
//  EliteShowroom
//
//  Created by Cole on 07/06/2022.
//  Copyright © 2022 Cole. All rights reserved.
//

import UIKit
import SwiftSVG
import SDWebImageWebPCoder

var myView = UIViewController()
var table = UITableView()
var table2 = UITableView()
var table3 = UITableView()
var make1 = [MakeList]()
var list2 = [Result]()
var detail2 = [Welcome3]()
var media3 = [Welcome4]()
var link3 = String()


class DashboardTabBarController: UITabBarController, UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar(){
        let item1 = ViewController()
        let item2 = ViewController2()
        navigationController?.navigationBar.prefersLargeTitles = true
        tabBar.backgroundColor = .black
        tabBar.barStyle = .blackOpaque
        tabBar.tintColor = .white
        item1.tabBarItem.image = UIImage(named: "Image")?.withRenderingMode(.alwaysOriginal)
        item1.tabBarItem.selectedImage = UIImage(named: "Image-1")?.withRenderingMode(.alwaysOriginal)
        item1.tabBarItem.title = "Makes"
        item1.title = "Makes"
        item2.tabBarItem.image = UIImage(named: "Search")?.withRenderingMode(.alwaysOriginal)
        item2.tabBarItem.selectedImage = UIImage(named: "SearchB")?.withRenderingMode(.alwaysOriginal)
        item2.tabBarItem.title = "Search"
        let controllers = [item1,item2]  //array of the root view controllers displayed by the tab bar interface
        self.viewControllers = controllers
    }
    
    //Delegate methods
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        print("Should select viewController: \(viewController.title ?? "") ?")
        return true
    }
}

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //myView = self
        
        print("Hello World")
        parser.parse{
            datax in
            make1 = datax
            DispatchQueue.main.sync {
                table.reloadData()
            }
        }
        self.view.backgroundColor = .black
        setupTableView()
        
    }
    

    func setupTableView() {
        
        table.delegate = self
        table.dataSource = self
        table.separatorStyle = .singleLine
        table.indicatorStyle = .default
        table.frame = CGRect.init(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height-50)
        table.rowHeight = 100.0
        table.sectionHeaderHeight = 70
        table.isUserInteractionEnabled = true
        table.allowsSelection = true
        table.backgroundColor = .white
        view.addSubview(table)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return make1.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = makeMedia(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 100), title: "nasaMedia")
    
        print("Madam")
        print(make1.count)
        //Cell Population
        let filename = make1[indexPath.row].imageURL
        let extensionType = (filename as NSString).pathExtension
        print("Car Make and Image type")
        print(extensionType)
        print(make1[indexPath.row].name)
        let carName = make1[indexPath.row].name
        print(make1[indexPath.row].imageURL)
        if carName == "BMW" || carName == "Honda" || carName == "Nissan" || carName == "Mercedes-Benz"  {
            let svgURL = URL(string: make1[indexPath.row].imageURL)!
            let hammock = UIView(SVGURL: svgURL) { (svgLayer) in
                svgLayer.resizeToFit(cell.nasaimageView.bounds)
            }
            cell.nasaimageView.addSubview(hammock)
        } else if carName == "Jaguar" || carName == "Toyota" {
            cell.nasaimageView.downloaded(from: (make1[indexPath.row].imageURL))
        } else if carName == "Isuzu" || carName == "Mazda" || carName == "Mitsubishi" || carName == "Subaru" {
            cell.nasaimageView.image = UIImage(named: "missing_car")
        }
        cell.nasaimageView.backgroundColor = .white
        cell.nasaimageView.contentMode = .scaleAspectFit
        cell.nasatitle.text = make1[indexPath.row].name
        cell.date.text = "Make"
        cell.date.textColor = .gray
        cell.date.numberOfLines = 0
        cell.date.font = cell.date.font.withSize(18)
        
        return cell
        
        }
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 80))
        
        let label = UILabel()
        label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width, height: headerView.frame.height-10)
        label.text = "    Car Makes"
        let font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.font = font
        label.textColor = .white
        label.backgroundColor = hexStringToUIColor(hex: "#000000")
        headerView.addSubview(label)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
        let loadVC = ViewController2()
        self.present(loadVC, animated: true, completion: nil)
    }
    }


class ViewController2: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate  {
    
    func hexStringToUIColor (hex:String) -> UIColor {
        var cString:String = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()
        
        if (cString.hasPrefix("#")) {
            cString.remove(at: cString.startIndex)
        }
        
        if ((cString.count) != 6) {
            return UIColor.gray
        }
        
        var rgbValue:UInt64 = 0
        Scanner(string: cString).scanHexInt64(&rgbValue)
        
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //myView = self
        print("Hello WorldX")
        parser2.parse{
            datax in
            list2 = datax
            filtered = list2
            DispatchQueue.main.sync {
                table2.reloadData()
            }
        }
        self.navigationItem.title = "Makes"
        self.view.backgroundColor = .black
        setupTableView()
        
    }
    let searchBar = UISearchBar()
    func setupTableView() {
        table2.frame = CGRect.init(x: 0, y: 50, width: self.view.frame.width, height: self.view.frame.height-50)
        table2.delegate = self
        table2.dataSource = self
        table2.rowHeight = 100.0
        table2.clipsToBounds = true
        table2.sectionHeaderHeight = 70
        table2.separatorStyle = UITableViewCell.SeparatorStyle.none
        table2.isUserInteractionEnabled = true
        table2.allowsSelection = true
        table2.backgroundColor = .white
        view.addSubview(table2)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filtered.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nasaMedia(frame: CGRect(x: 0,y: 0,width: self.view.frame.width,height: 100), title: "nasaMedia")
        print("Madam2")
        //Cell Population
        let filename = filtered[indexPath.row].imageURL
        let extensionType = (filename as NSString).pathExtension
        print("extensionA")
        print(filtered[indexPath.row].title + " " + extensionType)
        cell.nasaimageView.downloaded(from: (filtered[indexPath.row].imageURL))
        cell.nasaimageView.contentMode = .scaleAspectFill
        cell.nasaimageView.layer.masksToBounds = true
        cell.nasatitle.text = filtered[indexPath.row].title
        cell.date.text = filtered[indexPath.row].city
        cell.date.textColor = .gray
        cell.date.numberOfLines = 0
        cell.date.font = cell.date.font.withSize(18)
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 150))
        let label = UILabel()
        label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width, height: 70)
        label.text = "    Search"
        let font = UIFont.systemFont(ofSize: 30, weight: .black)
        label.font = font
        label.textColor = .white
        label.backgroundColor = hexStringToUIColor(hex: "#000000")
        headerView.addSubview(label)
        searchBar.frame = CGRect(x: 0, y: 70, width: table.frame.width, height: 50)
        searchBar.delegate = self
        searchBar.backgroundColor = .black
        searchBar.barTintColor = .black
        searchBar.showsCancelButton = false
        searchBar.searchBarStyle = UISearchBar.Style.default
        searchBar.placeholder = " Search Here....."
        searchBar.sizeToFit()
        headerView.addSubview(searchBar)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("tapped")
        let loadVC = ViewController3()
        link3 = list2[indexPath.row].id
        self.present(loadVC, animated: true, completion: nil)
    }
    // This method updates filteredData based on the text in the Search Box
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filtered = list2.compactMap({ $0 }).filter { $0.title.contains(searchText) }
        if searchText == "" || searchText == nil {
        filtered = list2
        }
        table2.reloadData()
    }
}

var filtered = list2
class ViewController3: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //myView = self
        print("Hello WorldX")
        parser3.parse{
            datax in
            detail2 = datax
        }
        navigationItem.title = "Makes"
        setupTableView()
        
    }
    
    func setupTableView() {
        self.view.backgroundColor = .white
        label = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 21))
        label.textAlignment = .center
        self.view.addSubview(label)
        
     
        
        button = UIButton(frame: CGRect(x: 10, y: 60, width: 200, height: 21))
        button.setTitle("Media",for: .normal)
        button.backgroundColor = .orange
        button.addTarget(self, action: #selector(pressed), for: .touchUpInside)

        self.view.addSubview(button)
        
        button1 = UIButton(frame: CGRect(x: 10, y: 100, width: 200, height: 21))
        button1.setTitle("Close",for: .normal)
        button1.backgroundColor = .orange
        button1.addTarget(self, action: #selector(pressed2), for: .touchUpInside)
        
        self.view.addSubview(button1)
    }
    @objc func pressed() {
        let loadVC = ViewController4()
        self.present(loadVC, animated: true, completion: nil)    }
    @objc func pressed2() {
        self.dismiss(animated: true, completion: nil)
    }
}
var label = UILabel()
var button = UIButton()
var button1 = UIButton()
var button2 = UIButton()
var media = UILabel()

class ViewController4: UIViewController{
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //myView = self
        print("Hello WorldX")
        parser4.parse{
            datax in
            media3 = datax
        }
        setupTableView()
        
    }
    
    func setupTableView() {
        self.view.backgroundColor = .white
        media = UILabel(frame: CGRect(x: 0, y: 20, width: 200, height: 21))
        media.textAlignment = .center
        self.view.addSubview(media)
        
        button2 = UIButton(frame: CGRect(x: 10, y: 60, width: 200, height: 21))
        button2.setTitle("Media",for: .normal)
        button2.backgroundColor = .orange
        button2.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        
        self.view.addSubview(button2)
        
    }
    
    @objc func pressed() {
        self.dismiss(animated: true, completion: nil)
    }
   
}
struct nasaParser{
    
    
    // Retrieve Data From API 1
    func parse(comp : @escaping ([MakeList])->()){
        
        print("loading...")
        let api = URL(string: "https://api.staging.myautochek.com/v1/inventory/make?popular=true")
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            
            //Error Checking
            if error != nil{
                
              //  alertTitleGlobal = "Connection error"
              //  alertMessageGlobal = "Please check your internet connection or link"
              //  selfController.showAlert(alertText: alertTitleGlobal, alertMessage: alertMessageGlobal)
              //  alertOptionGlobal = "Retry"
              //  print(error?.localizedDescription)
              //  return
                
            }
            //JSON Decoding
            do {
                let result = try JSONDecoder().decode(Welcome.self , from: data!)
                //print(result.makeList?.count)
                print(result.makeList.count)
                print(result.makeList[0].name)
                //make1 = result.makeList
                DispatchQueue.main.sync {
                    print("This runs on the main queue.")
                make1 = result.makeList
                table.reloadData()
                }
            } catch {
                print("decoding error...")
                
            }
            }.resume()
        
        print("hello world 2")
        
        
    }
    
}


    
struct nasaParser2{
    
    
    // Retrieve Data From API 1
    func parse(comp : @escaping ([Result])->()){
        
        print("loading...")
        let api = URL(string: "https://api.staging.myautochek.com/v1/inventory/car/search")
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            
            //Error Checking
            if error != nil{
                
                //  alertTitleGlobal = "Connection error"
                //  alertMessageGlobal = "Please check your internet connection or link"
                //  selfController.showAlert(alertText: alertTitleGlobal, alertMessage: alertMessageGlobal)
                //  alertOptionGlobal = "Retry"
                //  print(error?.localizedDescription)
                //  return
                
            }
            //JSON Decoding
            do {
                let result = try JSONDecoder().decode(Welcome2.self , from: data!)
                //print(result.makeList?.count)

                print(result.pagination.total)
                list2 = result.result
                filtered = list2
                DispatchQueue.main.sync {
                table2.reloadData()
                }
            } catch {
                print("decoding error...")
                
            }
            }.resume()
        
        print("hello world 3")
        
        
    }
    
}


struct nasaParser3{
    
    
    // Retrieve Data From API 1
    func parse(comp : @escaping ([Welcome3])->()){
        
        print("loading...3")
        let api = URL(string: "https://api.staging.myautochek.com/v1/inventory/car/" + link3)
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            print(link3)
            print("link3")
            //Error Checking
            if error != nil{
                
                //  alertTitleGlobal = "Connection error"
                //  alertMessageGlobal = "Please check your internet connection or link"
                //  selfController.showAlert(alertText: alertTitleGlobal, alertMessage: alertMessageGlobal)
                //  alertOptionGlobal = "Retry"
                //  print(error?.localizedDescription)
                //  return
                
            }
            //JSON Decoding
            do {
                let result = try JSONDecoder().decode(Welcome3.self , from: data!)
                //print(result.makeList?.count)
                detail2 = [result]
                print("Boom1")
                print(detail2[0].carName)
                DispatchQueue.main.sync {
                label.text = detail2[0].carName
                }
                
            } catch {
                print("decoding error...3")
                print("Boom4")

                
            }
            }.resume()
        
        print("hello world 4")
        
        
    }
    
}


struct nasaParser4{
    
    
    // Retrieve Data From API 1
    func parse(comp : @escaping ([Welcome4])->()){
        
        print("loading...3")
        let api = URL(string: "https://api.staging.myautochek.com/v1/inventory/car_media?carId=oi5f5AcHP")
        
        URLSession.shared.dataTask(with: api!){
            data, response, error in
            
            //Error Checking
            if error != nil{
                
                //  alertTitleGlobal = "Connection error"
                //  alertMessageGlobal = "Please check your internet connection or link"
                //  selfController.showAlert(alertText: alertTitleGlobal, alertMessage: alertMessageGlobal)
                //  alertOptionGlobal = "Retry"
                //  print(error?.localizedDescription)
                //  return
                
            }
            //JSON Decoding
            do {
                let result = try JSONDecoder().decode(Welcome4.self, from: data!)
                //print(result.makeList?.count)
                media3 = [result]
                print(result.carMediaList[0].type)
                 DispatchQueue.main.sync {
                media.text = result.carMediaList[0].type
                }
            } catch {
                print("decoding error...5")
                
            }
            }.resume()
        
        print("hello world 4")
        
        
    }
    
}


//Image downloader

extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
            }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}

