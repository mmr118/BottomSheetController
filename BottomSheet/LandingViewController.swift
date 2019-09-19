//
//  LandingViewController.swift
//  BottomSheet
//
//  Created by Ahmed Elassuty on 7/1/16.
//  Copyright © 2016 Ahmed Elassuty. All rights reserved.
//

import UIKit

class LandingViewController: UIViewController {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        addBottomSheetView()
    }

    func addBottomSheetView() {
        
        let scrollable = tabBarItem.title == "Scrollable"
        
        let bottomVC: UIViewController
        
        switch scrollable {
        case true:
            guard let bottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "scrollableBottomSheetVC") as? ScrollableBottomSheetViewController else { fatalError() }
            bottomVC = bottomSheetVC

        case false:
            guard let bottomSheetVC = storyboard?.instantiateViewController(withIdentifier: "bottomSheetVC") as? BottomSheetViewController else { fatalError() }
            bottomVC = bottomSheetVC
        }
        
        self.addChild(bottomVC)
        self.view.addSubview(bottomVC.view)
        bottomVC.didMove(toParent: self)

        let height = view.frame.height
        let width  = view.frame.width
        bottomVC.view.frame = CGRect(x: 0, y: view.frame.maxY, width: width, height: height)
    }

}
