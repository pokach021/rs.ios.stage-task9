//
// 📰 🐸
// Project: RSSchool_T9
//
// Author: Andrew Pokachailo
// On: 8/3/21
//
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 4
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    func configure(_ image: UIImage) {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 8
        self.layer.backgroundColor = UIColor.cyan.cgColor
        imageView.image = image
        self.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
            imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10),
            imageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            imageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10)
        ])
        
    }
    
    
}


