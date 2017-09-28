//
//  CustomTransitionDelegate.swift
//  CustomTransitionViewController
//
//  Created by Renato Matos on 15/09/17.
//  Copyright © 2017 Studio WO. All rights reserved.
//

import UIKit

class CustomTransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {
    
    let customAnimated = CustomAnimatedTransitionProtocol()
    var interactor: CustomInteractor? = nil
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.customAnimated
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self.customAnimated
    }
    
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return CustomPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let interactor = self.interactor {
            return interactor.hasStarted ? interactor : nil
        }
        
        return nil
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if let interactor = self.interactor {
            return interactor.hasStarted ? interactor : nil
        }
        
        return nil
    }
    
}
