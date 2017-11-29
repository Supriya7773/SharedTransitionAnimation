//
//  HomeViewController.swift
//  SampleAnimation
//
//  Created by Supriya Malgaonkar on 29/11/17.
//  Copyright © 2017 Supriya Malgaonkar. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UINavigationControllerDelegate, RMPZoomTransitionAnimating {
    

    @IBOutlet weak var imagesTableView: UITableView!
   
    var selectedImage: UIImageView!
    var selectedFrame: CGRect!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Home"
//        self.navigationController?.delegate = self
        imagesTableView.tableFooterView = UIView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    //MARK: - TableView Datasource & Delegate
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "homeCell", for: indexPath) as! HomeTableViewCell
        cell.cellLabel.text = "\(indexPath.row)"
        cell.cellImage.image = UIImage(named: "\(indexPath.row)")
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let selectedCell = tableView.cellForRow(at: indexPath) as! HomeTableViewCell
        selectedImage = selectedCell.cellImage
        selectedFrame = selectedCell.cellImage.frame
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "detailView") as! DetailViewController
        detailVC.selectedIndex = "\(indexPath.row)"
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
    
    
    //MARK: - Transition Delegates
    
    func transitionSourceImageView() -> UIImageView {
        return selectedImage
    }
    
    func transitionSourceBackgroundColor() -> UIColor {
        return UIColor.clear
    }
    
    func transitionDestinationImageViewFrame() -> CGRect {
        return selectedFrame
    }
    
    
    //MARK: - Navigation Delegate
    
    func navigationController(_ navigationController: UINavigationController,
                              animationControllerFor operation: UINavigationControllerOperation,
                              from fromVC: UIViewController,
                              to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let animator = RMPZoomTransitionAnimator(animationDurationForward: 1,
                                                 forwardComplete: 2,
                                                 backward: 2,
                                                 backwardComplete: 1)
        animator.goingForward = (operation == .push)
        animator.sourceTransition = fromVC as? RMPZoomTransitionAnimating & RMPZoomTransitionDelegate
        animator.destinationTransition = toVC as? RMPZoomTransitionAnimating & RMPZoomTransitionDelegate
        return animator
    }

}
