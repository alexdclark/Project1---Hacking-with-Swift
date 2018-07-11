//
//  DetailViewController.swift
//  Project1
//
//  Created by Alexander Clark on 7/10/18.
//  Copyright © 2018 Alexander Clark. All rights reserved.
//

import UIKit

//The Detail View controller that holds the image the user will see.
class DetailViewController: UIViewController {

    //Outlet created when I dragged image view to code.
    @IBOutlet var imageView: UIImageView!
    
    //String to hold the image that was tapped! I think it should be a string!
    var selectedImage: String?
    
    
    override func viewDidLoad() {
        
        //Letting iOS do its work first!
        super.viewDidLoad()
        
        //Setting title of Detail View to the name of the selected image
        title = selectedImage

        //Setting image to image (Using UIImage named: imageToLoad
        if let imageToLoad = selectedImage {
            imageView.image = UIImage(named: imageToLoad)
        }
        // Do any additional setup after loading the view.
    }
    
    //Allowing bars to disappear on tap
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
    }
    //Allow bars to reappear on tap
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
    }

    
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
