//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class CloseButton: UIButton {
    init() {
        super.init(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        self.backgroundColor = .clear
        self.layer.cornerRadius = 20
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.tintColor = .white
        self.setImage(UIImage(systemName: "xmark"), for: .normal)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
