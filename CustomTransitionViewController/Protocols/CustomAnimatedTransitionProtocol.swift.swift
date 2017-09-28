//
//  CustomAnimatedTransitionProtocol.swift.swift
//  CustomTransitionViewController
//
//  Created by Renato Matos on 07/08/17.
//  Copyright © 2017 Studio WO. All rights reserved.
//

import UIKit
import Foundation

class CustomAnimatedTransitionProtocol: NSObject, UIViewControllerAnimatedTransitioning {
    
    var blurEffectView = UIVisualEffectView(frame: .zero)
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 2.5
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let destination = transitionContext.viewController(forKey: .to) {
            
            if destination.isBeingPresented {
                self.presentAnimateTransition(using: transitionContext)
            } else {
                self.dismissAnimateTransition(using: transitionContext)
            }
        }
    }
    
    func presentAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        if let toViewController = transitionContext.viewController(forKey: .to), let fromViewController = transitionContext.viewController(forKey: .from) {
            let finalFrameForVc = transitionContext.finalFrame(for: toViewController)
            
            let containerView = transitionContext.containerView
            
            let bounds = UIScreen.main.bounds
            
            toViewController.view.frame = finalFrameForVc.offsetBy(dx: 0, dy: bounds.size.height)
            self.blurEffectView.frame = bounds
            
            containerView.addSubview(self.blurEffectView)
            containerView.addSubview(toViewController.view)
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), delay: 0.2, animations: {
                
                self.blurEffectView.effect = UIBlurEffect(style: .light)
                fromViewController.view.alpha = 0.5
                toViewController.view.frame = finalFrameForVc
                
            }, completion: { (finished) in
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
            })
        }
    }
    
    func dismissAnimateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if let fromViewController = transitionContext.viewController(forKey: .from), let toViewController = transitionContext.viewController(forKey: .to) {
            let finalFrameForVc = transitionContext.finalFrame(for: fromViewController)
            
            let bounds = UIScreen.main.bounds
            
            UIView.animate(withDuration: self.transitionDuration(using: transitionContext), animations: {
                
                self.blurEffectView.effect = nil
                fromViewController.view.frame = finalFrameForVc.offsetBy(dx: 0, dy: bounds.size.height)
                toViewController.view.alpha = 1
                
            }, completion: { (finished) in
                
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
                
            })
        }
        
    }
    
}
