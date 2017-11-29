//
//  DetailViewController.swift
//  SampleAnimation
//
//  Created by Supriya Malgaonkar on 29/11/17.
//  Copyright © 2017 Supriya Malgaonkar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, RMPZoomTransitionAnimating {
    
    @IBOutlet weak var displayImageView: UIImageView!
    
    
    var selectedIndex : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if selectedIndex != nil {
            self.title = "\(selectedIndex!)"
            self.displayImageView.image = UIImage(named: "\(selectedIndex!)")
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    
    //MARK: - Animation Delegates
    
    func transitionSourceImageView() -> UIImageView {
        return displayImageView
    }
    
    func transitionSourceBackgroundColor() -> UIColor {
        return UIColor.clear
    }
    
    func transitionDestinationImageViewFrame() -> CGRect {
        return displayImageView.frame
    }
}
