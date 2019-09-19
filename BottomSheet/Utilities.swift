//
//  Utilities.swift
//  BottomSheet
//
//  Created by Monica Rondón on 9/19/19.
//  Copyright © 2019 Ahmed Elassuty. All rights reserved.
//

import UIKit

extension CGColor {
    
    public var uiColor: UIColor { return UIColor(cgColor: self) }
    
}

extension UIView {

    // MARK: - Border
    @IBInspectable var borderColor: UIColor? {
        get { return layer.borderColor?.uiColor }
        set { layer.borderColor = newValue?.cgColor }
    }

    @IBInspectable var cornerRadius: CGFloat {
        get { return layer.cornerRadius }
        set { layer.cornerRadius = newValue }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get { return layer.borderWidth }
        set { layer.borderWidth = newValue }
    }
    
    // MARK: - Shadow
    @IBInspectable var shadowColor: UIColor? {
        get { return layer.shadowColor?.uiColor }
        set { layer.shadowColor = newValue?.cgColor }
    }

    @IBInspectable var shadowRadius: CGFloat {
        get { return layer.shadowRadius }
        set { layer.shadowRadius = newValue }
    }

    @IBInspectable var shadowOpacity: Float {
        get { return layer.shadowOpacity }
        set { layer.shadowOpacity = newValue }
    }

    @IBInspectable var shadowOffset: CGSize {
        get { return layer.shadowOffset }
        set { layer.shadowOffset = newValue }
    }

}
