//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/30/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class MainCollectionViewCell: UICollectionViewCell {
    
    var imageView = UIImageView()
    var mainTitle = UILabel()
    var subTitle = UILabel()
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setup(index: Int) {
        self.backgroundColor = .white
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = 18
        
        imageView.frame = CGRect(x: 8, y: 10, width: self.bounds.width - 16, height: self.bounds.height - 20)
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        imageView.layer.cornerRadius = 10
        imageView.layer.borderColor = UIColor.black.cgColor
        self.addSubview(imageView)
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.font = UIFont(name: "Rockwell-Regular", size: CGFloat(self.frame.height * 0.075))
        mainTitle.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        mainTitle.numberOfLines = 1
        self.addSubview(mainTitle)
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.74),
            mainTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1),
            mainTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(self.frame.width * 0.1)),
            mainTitle.heightAnchor.constraint(equalToConstant: (self.frame.height * 0.075) + 2)
        ])
        
        subTitle.translatesAutoresizingMaskIntoConstraints = false
        subTitle.font = UIFont(name: "Rockwell-Regular", size: CGFloat(self.frame.height * 0.06))
        subTitle.textColor = UIColor(red: 0.712, green: 0.712, blue: 0.712, alpha: 1)
        self.addSubview(subTitle)
        NSLayoutConstraint.activate([
            subTitle.topAnchor.constraint(equalTo: mainTitle.bottomAnchor, constant: self.frame.height * 0.012),
            subTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.1),
            subTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            subTitle.heightAnchor.constraint(equalToConstant: (self.frame.height * 0.06) + 1)
        ])
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = imageView.bounds
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
        gradientLayer.locations = [0.7, 1.0]
        imageView.layer.insertSublayer(gradientLayer, at: 0)
        
        switch FillingData.data[index]{
        case .story(let story):
            imageView.image = story.coverImage
            mainTitle.text = story.title
            subTitle.text = story.type
        case .gallery(let gallery):
            imageView.image = gallery.coverImage
            mainTitle.text = gallery.title
            subTitle.text = gallery.type
        }
    }
}
