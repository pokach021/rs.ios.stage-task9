//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/28/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation
import UIKit

extension UIColor {
    convenience init(rgb: Int, a: CGFloat = 1.0) {
           self.init(
            red: CGFloat((rgb >> 16) & 0xFF),
            green: CGFloat((rgb >> 8) & 0xFF),
            blue: CGFloat(rgb & 0xFF), alpha: a
            
           )
       }
    
}
