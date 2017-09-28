//
//  CustomViewController.swift
//  CustomTransitionViewController
//
//  Created by Renato Matos on 07/08/17.
//  Copyright © 2017 Studio WO. All rights reserved.
//

import UIKit
import Foundation

class CustomViewController: UIViewController {
    
    let customTransitionDelegate = CustomTransitioningDelegate()
    var interactor: CustomInteractor? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self .setupGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func actionViewController(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
