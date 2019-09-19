//
//  BottomSheetViewController.swift
//  BottomSheet
//
//  Created by Ahmed Elassuty on 7/1/16.
//  Copyright © 2016 Ahmed Elassuty. All rights reserved.
//

import UIKit

class BottomSheetViewController: UIViewController {
    
    // holdView can be UIImageView instead
    @IBOutlet weak var holdView: UIView!
    @IBOutlet weak var left: UIButton!
    @IBOutlet weak var right: UIButton!
    
    let fullView: CGFloat = 100
    var partialView: CGFloat { return UIScreen.main.bounds.height - (left.frame.maxY + UIApplication.shared.statusBarFrame.height) }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let gesture = UIPanGestureRecognizer.init(target: self, action: #selector(BottomSheetViewController.panGesture))
        view.addGestureRecognizer(gesture)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        prepareBackgroundView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 0.6, animations: { [weak self] in
            let frame = self?.view.frame
            let yComponent = self?.partialView
            self?.view.frame = CGRect(x: 0, y: yComponent!, width: frame!.width, height: frame!.height)
            }) { _ in
                self.checkIBInspectibles()
        }
    }
    
    @IBAction func rightButton(_ sender: AnyObject) {
        print("clicked")
    }
    
    @IBAction func close(_ sender: AnyObject) {
        UIView.animate(withDuration: 0.3, animations: {
            let frame = self.view.frame
            self.view.frame = CGRect(x: 0, y: self.partialView, width: frame.width, height: frame.height)
        }) 
    }
    
    @objc func panGesture(_ recognizer: UIPanGestureRecognizer) {
        
        let translation = recognizer.translation(in: self.view)
        let velocity = recognizer.velocity(in: self.view)
        let y = self.view.frame.minY
        if ( y + translation.y >= fullView) && (y + translation.y <= partialView ) {
            self.view.frame = CGRect(x: 0, y: y + translation.y, width: view.frame.width, height: view.frame.height)
            recognizer.setTranslation(CGPoint.zero, in: self.view)
        }
        
        if recognizer.state == .ended {
            var duration =  velocity.y < 0 ? Double((y - fullView) / -velocity.y) : Double((partialView - y) / velocity.y )
            
            duration = duration > 1.3 ? 1 : duration
            
            UIView.animate(withDuration: duration, delay: 0.0, options: [.allowUserInteraction], animations: {
                if  velocity.y >= 0 {
                    self.view.frame = CGRect(x: 0, y: self.partialView, width: self.view.frame.width, height: self.view.frame.height)
                } else {
                    self.view.frame = CGRect(x: 0, y: self.fullView, width: self.view.frame.width, height: self.view.frame.height)
                }
                
                }, completion: nil)
        }
    }
    
    func checkIBInspectibles() {
        
        if (view.layer.cornerRadius == 5) == false {
            assertionFailure()
        }
        
        if (view.clipsToBounds == true) == false {
            assertionFailure()
        }
        
        if (holdView.layer.cornerRadius == 3) == false {
            assertionFailure()
        }
        
        if (left.layer.cornerRadius == 10) == false {
            assertionFailure()
        }
        
        if (left.layer.borderColor == UIColor(red: 0, green: 148/255, blue: 247.0/255.0, alpha: 1).cgColor) == false {
//            assertionFailure()
        }
        
        if (left.layer.borderWidth == 1) == false {
            assertionFailure()
        }
        
        if (right.layer.cornerRadius == 10) == false {
            assertionFailure()
        }
        
    }
    
    func prepareBackgroundView(){
        let blurEffect = UIBlurEffect.init(style: .dark)
        let visualEffect = UIVisualEffectView.init(effect: blurEffect)
        let bluredView = UIVisualEffectView.init(effect: blurEffect)
        bluredView.contentView.addSubview(visualEffect)
        
        visualEffect.frame = UIScreen.main.bounds
        bluredView.frame = UIScreen.main.bounds
        
        view.insertSubview(bluredView, at: 0)
    }

}
