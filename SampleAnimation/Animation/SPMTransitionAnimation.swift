//
//  SPMTransitionAnimation.swift
//  SampleAnimation
//
//  Created by Supriya Malgaonkar on 29/11/17.
//  Copyright © 2017 Supriya Malgaonkar. All rights reserved.
//

import UIKit

class SPMTransitionAnimation: NSObject, UIViewControllerAnimatedTransitioning {
    enum typeAnimation: String {
        case zoomba = "zoom_in_out"
        case disolve = "desolved"
    }
    
    var kPushDefaultDuration = 0.5
    var kPopDefaultDuration = 0.3
    
    var animationType: typeAnimation = .zoomba
    
    var isPushingOperation: Bool = true
    
    var fromAnimatableView: UIView?
    var fromAnimatableFrame = CGRect.zero
    
    var toAnimatableView: UIView!
    var toAnimatableFrame = CGRect.zero
    
    
    func setDefaultDuration() {
        kPushDefaultDuration = 0.5
        kPopDefaultDuration = 0.3
    }
    
    
    //MARK: - Animation Delegate
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        if isPushingOperation {
            return (2*kPushDefaultDuration)
        }
        else {
            return (2*kPopDefaultDuration)
        }
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        let fromVC = (transitionContext.viewController(forKey: .from))!
        let toVC = (transitionContext.viewController(forKey: .to))!
        let finalFrameVC = transitionContext.finalFrame(for: toVC)
        let containerView = transitionContext.containerView
        toVC.view.frame = finalFrameVC
        toVC.view.alpha = 0
        containerView.addSubview(toVC.view)
        containerView.sendSubview(toBack: toVC.view)
        
        var snapshotView: UIView?
        
        if fromAnimatableView != nil {
            snapshotView = fromAnimatableView!.snapshotView(afterScreenUpdates: false)
            snapshotView?.frame = fromAnimatableFrame
        }
        else {
            snapshotView = fromVC.view.snapshotView(afterScreenUpdates: false)
            snapshotView?.frame = fromVC.view.frame
        }
        
        print("\n snapshotView?.frame : \(String(describing: snapshotView?.frame))")
        containerView.addSubview(snapshotView!)
        
        fromVC.view.removeFromSuperview()
        
        UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
            snapshotView?.frame = CGRect.zero
            snapshotView?.center = CGPoint(x: finalFrameVC.size.width/2, y: 0)
            print("\n snapshotView?.frame : \(String(describing: snapshotView?.frame))")
            toVC.view.alpha = 1.0
        }, completion: { finished in
            snapshotView?.removeFromSuperview()
            toVC.view.alpha = 1.0
            transitionContext.completeTransition(true)
        })
        
    }
}
