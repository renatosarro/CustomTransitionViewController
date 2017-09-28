//
//  ViewController.swift
//  CustomTransitionViewController
//
//  Created by Renato Matos on 07/08/17.
//  Copyright © 2017 Studio WO. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let customTransitionDelegate = CustomTransitioningDelegate()
    var controller: CustomViewController?
    let interactor = CustomInteractor()
    
    var interactionController: UIPercentDrivenInteractiveTransition?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.controller = self.storyboard?.instantiateViewController(withIdentifier: "CustomViewController") as? CustomViewController
        
        if let controller = self.controller {
            
            customTransitionDelegate.interactor = self.interactor
            controller.transitioningDelegate = customTransitionDelegate
            controller.interactor = self.interactor
        }
        
        self.setupGesture()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionViewController(_ sender: Any) {
        
        if let controller = self.controller {
            
            controller.modalPresentationStyle = .custom
            self.present(controller, animated: true, completion: nil)
        }
        
    }
    
}

