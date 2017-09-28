//
//  ViewController+Gesture.swift
//  CustomTransitionViewController
//
//  Created by Renato Matos on 28/09/17.
//  Copyright © 2017 Studio WO. All rights reserved.
//

import UIKit

extension ViewController {
    
    func setupGesture() {
        
        let panUp = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        self.view.addGestureRecognizer(panUp)
    }
    
    func handleGesture(_ gesture: UIPanGestureRecognizer) {
        
        if gesture.location(in: gesture.view!.superview).y >= UIScreen.main.bounds.height - 100 || self.interactor.hasStarted {
            
            let view = gesture.view!.superview
            var progress = -(gesture.translation(in: view).y / UIScreen.main.bounds.size.height)
            progress = progress * 0.2
            
            switch gesture.state {
            case .began:
                
                self.interactor.hasStarted = true
                present(self.controller!, animated: true, completion: nil)
                
            case .changed:
                
                self.interactor.shouldFinish = gesture.translation(in: view).y < -150
                self.interactor.update(progress)
                
            case .cancelled:
                
                self.interactor.hasStarted = false
                self.interactor.completionSpeed = 1
                self.interactor.cancel()
                
            case .ended:
                
                self.interactor.hasStarted = false
                self.interactor.completionSpeed = 1 - progress
                
                if self.interactor.shouldFinish {
                    self.interactor.finish()
                } else {
                    self.interactor.cancel()
                }
                
            default:
                break
            }
            
        }
        
    }
    
}
