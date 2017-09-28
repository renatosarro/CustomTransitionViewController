//
//  CustomViewController+Gesture.swift
//  CustomTransitionViewController
//
//  Created by Renato Matos on 28/09/17.
//  Copyright © 2017 Studio WO. All rights reserved.
//

import UIKit

extension CustomViewController {
    
    func setupGesture() {
        
        let panUp = UIPanGestureRecognizer(target: self, action: #selector(handleGesture(_:)))
        self.view.addGestureRecognizer(panUp)
    }
    
    func handleGesture(_ gesture: UIPanGestureRecognizer) {
        
        let view = gesture.view!.superview
        let point = view!.convert(gesture.translation(in: view), to: view)
        var progress = (point.y / UIScreen.main.bounds.size.height)
        progress = progress * 0.2
        
        guard let interactor = self.interactor else { return }
        
        switch gesture.state {
        case .began:
            
            interactor.hasStarted = true
            dismiss(animated: true, completion: nil)
            
        case .changed:
            
            interactor.shouldFinish = gesture.translation(in: view).y > 150
            interactor.update(progress)
            
        case .cancelled:
            
            interactor.hasStarted = false
            interactor.completionSpeed = 1
            interactor.cancel()
            
        case .ended:
            
            interactor.hasStarted = false
            interactor.completionSpeed = 1-progress
            
            if interactor.shouldFinish {
                interactor.finish()
            } else {
                interactor.cancel()
            }
            
        default:
            break
        }
        
    }
}
