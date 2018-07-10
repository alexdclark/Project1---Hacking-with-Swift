//
//  ViewController.swift
//  Project1
//
//  Created by Alexander Clark on 7/10/18.
//  Copyright © 2018 Alexander Clark. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        title="Storm Viewer"
        // Do any additional setup after loading the view, typically from a nib.
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        
        let items = try! fm.contentsOfDirectory(atPath: path)
    
        for item in items {
            if (item.hasPrefix("nssl")){
                pictures.append(item)
            }
        }
        print(pictures)
            
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int{
        return pictures.count
    }
    
    
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
           vc.selectedImage = pictures[index.row]
        
        navigationController?.pushViewController(vc, animated: true)
        }
    }
    
     func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController?.hidesBarsOnTap ?? false
    }
    
}

