//
//  NearbyViewController.swift
//  Yelp
//
//  Created by Tejen Hasmukh Patel on 2/15/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class NearbyViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), forBarMetrics: UIBarMetrics.Default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = UIColor(red: 0.765, green: 0.141, blue: 0, alpha: 1);
        navigationController?.navigationBar.translucent = false;
        navigationController?.navigationBar.tintColor = UIColor.whiteColor();
        
        let logo = UIImage(named: "Logo-Header");
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 30));
        imageView.contentMode = .ScaleAspectFit;
        imageView.image = logo;
        self.navigationItem.titleView = imageView;

        searchBar.translucent = true;
        searchBar.backgroundColor = UIColor.clearColor();
        searchBar.backgroundImage = UIImage();
        searchBar.delegate = self;
        for subview in searchBar.subviews {
            for subsubview in subview.subviews {
                if (subsubview.isKindOfClass(NSClassFromString("UISearchBarBackground")!)) {
                    subsubview.alpha = 0;
                    break;
                }
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func searchBarSearchButtonClicked(searchBar: UISearchBar) {
        searchBar.endEditing(false);
        self.resignFirstResponder();
        appDelegate.search_term = searchBar.text!;
        appDelegate.switchToSearchTab();
    }

}
