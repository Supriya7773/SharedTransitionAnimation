//
//  DetailViewController.swift
//  SampleAnimation
//
//  Created by Supriya Malgaonkar on 29/11/17.
//  Copyright © 2017 Supriya Malgaonkar. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UINavigationControllerDelegate, UIViewControllerTransitioningDelegate, RMPZoomTransitionAnimating, RMPZoomTransitionDelegate {
    
    @IBOutlet weak var displayImageView: UIImageView!
    
    
    var selectedIndex : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.alpha = 0
        self.navigationController?.delegate = self
        self.transitioningDelegate = self
        if selectedIndex != nil {
            self.title = "\(selectedIndex!)"
            self.displayImageView.image = UIImage(named: "\(selectedIndex!)")
        }
        let currentFrame = self.view.frame
        self.view.frame = CGRect(x: currentFrame.origin.x, y: currentFrame.origin.y, width: currentFrame.size.width, height: 0)
        UIView.animate(withDuration: 0.5) {
            self.view.frame = currentFrame
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("\n displayImageView frame : \(displayImageView.frame)")
        print("")
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
