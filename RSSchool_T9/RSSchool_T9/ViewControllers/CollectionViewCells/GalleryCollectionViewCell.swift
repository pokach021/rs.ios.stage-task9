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
    
    var mainTitle = UILabel()
    var mainImageView = UIImageView()
    var mainTitleStr = "test"
    var text = "text"
    
    
    
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    func setupFirstSection() {
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.clear.cgColor
        self.layer.cornerRadius = 8
        
        
        mainImageView.frame = CGRect(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        mainImageView.layer.borderWidth = 1
        mainImageView.layer.borderColor = UIColor.white.cgColor
        mainImageView.layer.cornerRadius = 8
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.clipsToBounds = true
        self.addSubview(mainImageView)
        
        mainTitle.translatesAutoresizingMaskIntoConstraints = false
        mainTitle.font = UIFont(name: "Rockwell-Regular", size: CGFloat(self.frame.height * 0.075))
        mainTitle.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        mainTitle.numberOfLines = 1
        self.addSubview(mainTitle)
        NSLayoutConstraint.activate([
            mainTitle.topAnchor.constraint(equalTo: self.topAnchor, constant: self.frame.height * 0.78),
            mainTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: self.frame.width * 0.08),
            mainTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -(self.frame.width * 0.08)),
            mainTitle.heightAnchor.constraint(equalToConstant: (self.frame.height * 0.116) + 2)
        ])
        
        let gradientLayer: CAGradientLayer = {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = mainImageView.bounds
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradientLayer.locations = [0.51, 1.0]
            return gradientLayer
        }()
        mainImageView.layer.insertSublayer(gradientLayer, at: 0)
        
        // typeLabel
        let typeLabel: PaddingLabel = {
            let typeLabel = PaddingLabel()
            typeLabel.translatesAutoresizingMaskIntoConstraints = false
            typeLabel.backgroundColor = .black
            typeLabel.clipsToBounds = true
            typeLabel.layer.cornerRadius = 8
            typeLabel.layer.borderWidth = 1
            typeLabel.layer.borderColor = UIColor.white.cgColor
            typeLabel.text = mainTitleStr
            typeLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
            typeLabel.textColor = .white
            typeLabel.padding(8, 3, 30, 30)
            return typeLabel
        }()
        self.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.centerYAnchor.constraint(equalTo: mainImageView.bottomAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor)
        ])
        
        // line
        let lineView: UIView = {
            let lineView = UIView()
            lineView.translatesAutoresizingMaskIntoConstraints = false
            lineView.backgroundColor = .white
            return lineView
        }()
        self.addSubview(lineView)
        NSLayoutConstraint.activate([
            lineView.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 50),
            lineView.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor),
            lineView.widthAnchor.constraint(equalToConstant: self.mainImageView.bounds.width - 160),
            lineView.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    func setupSecondSection() {
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.white.cgColor
        self.layer.cornerRadius = 8
        
        self.addSubview(mainImageView)
        mainImageView.layer.cornerRadius = 4
        mainImageView.clipsToBounds = true
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.frame = CGRect(x: 10, y: 10, width: self.bounds.width - 20, height: self.bounds.height - 20)
//        NSLayoutConstraint.activate([
//            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
//            mainImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
//            mainImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10),
//            mainImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10)
//        ])
//
        
        
    }
    
    func setupSecondSectionStory() {
//            let collectionPathView: UICollectionView = {
//            let flowLayout = UICollectionViewFlowLayout()
//            let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
//            flowLayout.scrollDirection = .horizontal
//            collection.translatesAutoresizingMaskIntoConstraints = false
//            collection.showsHorizontalScrollIndicator = false
//            collection.backgroundColor = .black
//            collection.layer.cornerRadius = 8
//            collection.layer.borderWidth = 1
//            collection.layer.borderColor = UIColor.white.cgColor
//            return collection
//        }()
//        self.addSubview(collectionPathView)
//        NSLayoutConstraint.activate([
//            collectionPathView.topAnchor.constraint(equalTo: self.topAnchor),
//            collectionPathView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
//            collectionPathView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
//            collectionPathView.heightAnchor.constraint(equalToConstant: self.bounds.width * 0.6)
//        ])
        let textLabel: UITextView = {
            let textLabel = UITextView()
            textLabel.isScrollEnabled = false
            textLabel.translatesAutoresizingMaskIntoConstraints = false
            textLabel.backgroundColor = .black
            textLabel.layer.cornerRadius = 8
            textLabel.layer.borderWidth = 1
            textLabel.layer.borderColor = UIColor.white.cgColor
            textLabel.textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 40)
            textLabel.text = text
            textLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
            textLabel.textColor = .white
            return textLabel
        }()
        
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: self.topAnchor),
            textLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            textLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            textLabel.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            textLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    
}


