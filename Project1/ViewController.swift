//
//  ViewController.swift
//  Project1
//
//  Created by Alexander Clark on 7/10/18.
//  Copyright © 2018 Alexander Clark. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    //Creating Array to hold Pictures
    var pictures = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Switching to large titles!
        navigationController?.navigationBar.prefersLargeTitles = true
        //Assigning a title to the Table View
        title="Storm Viewer"
        
       
        // Do any additional setup after loading the view, typically from a nib.
        
        //Creating a file manager
        let fm = FileManager.default
        //Setting Path to the path to the storm pictures
        let path = Bundle.main.resourcePath!
        
        //Creating an array of all resources forcing it to check because we KNOW there will be files.
        let items = try! fm.contentsOfDirectory(atPath: path)
    
        //Looping through resources and seeing if image starts with nssl if so append to picture array
        for item in items {
            if (item.hasPrefix("nssl")){
                pictures.append(item)
            }
        }
        //For debugging purposes print out Picture Array
        print(pictures)
            
    }
    
    //Setting number of cells in Table View based off picture array .count
    override func tableView(_ tableView: UITableView, numberOfRowsInSection: Int) -> Int{
        return pictures.count
    }
    
    //Setting Cell Text to name of Picture
    override func tableView(_ tableView:UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "Picture", for: indexPath)
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }

    //When Cell is tapped load Detail View (View with image)
    override func tableView(_ tableView: UITableView, didSelectRowAt index: IndexPath) {
        
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController{
           vc.selectedImage = pictures[index.row]
        navigationController?.pushViewController(vc, animated: true)
            
        }
    }
    
    //Hiding home indicator on iPhone X!
     func prefersHomeIndicatorAutoHidden() -> Bool {
        return navigationController?.hidesBarsOnTap ?? false
    }
    
}

