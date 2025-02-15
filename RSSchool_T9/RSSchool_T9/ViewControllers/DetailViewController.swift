//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 8/4/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class DetailViewController: UIViewController, UIScrollViewDelegate {
    var item = FillingData.data
    var drawOFF = false
    var strokeColor = UIColor.red.cgColor
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .black
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let mainImageView: UIImageView = {
        let mainImageView = UIImageView()
        mainImageView.contentMode = .scaleAspectFill
        mainImageView.clipsToBounds = true
        mainImageView.backgroundColor = .white
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        mainImageView.layer.cornerRadius = 8
        mainImageView.layer.borderWidth = 1
        mainImageView.layer.borderColor = UIColor.white.cgColor
        return mainImageView
    }()
    
    let line: UIView = {
        var line = UIView()
        line.translatesAutoresizingMaskIntoConstraints = false
        line.backgroundColor = .white
        return line
    }()
    
    let titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.backgroundColor = .clear
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont(name: "Rockwell-Regular", size: 48)
        titleLabel.textColor = .white
        return titleLabel
    }()
    
    let typeLabel: PaddingLabel = {
        let typeLabel = PaddingLabel()
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        typeLabel.backgroundColor = .black
        typeLabel.clipsToBounds = true
        typeLabel.layer.cornerRadius = 8
        typeLabel.layer.borderWidth = 1
        typeLabel.layer.borderColor = UIColor.white.cgColor
        typeLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
        typeLabel.textColor = .white
        typeLabel.padding(8, 3, 30, 30)
        return typeLabel
    }()

    let closeButton: CloseButton = {
        let closeButton = CloseButton.init()
        closeButton.addTarget(self, action: #selector(closeVC(_:)), for: .touchUpInside)
        return closeButton
    }()
    
    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
        imageView.layer.borderWidth = 1
        //imageView.layer.borderColor = UIColor.white.cgColor
        return imageView
    }()
    
    let galleryView: UIView = {
        let galleryView = UIView()
        galleryView.translatesAutoresizingMaskIntoConstraints = false
        galleryView.contentMode = .scaleAspectFill
        galleryView.layer.cornerRadius = 8
        galleryView.clipsToBounds = true
        galleryView.layer.borderWidth = 1
        galleryView.layer.borderColor = UIColor.white.cgColor
        return galleryView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.setup()
        
    }
    
    func setup() {
        // scroll
        self.view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        //imageView
        scrollView.addSubview(mainImageView)
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 100),
            mainImageView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            mainImageView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            mainImageView.heightAnchor.constraint(equalToConstant: 500),
            mainImageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor)
        ])
        //line
        scrollView.addSubview(line)
        NSLayoutConstraint.activate([
            line.topAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: 50),
            line.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor),
            line.widthAnchor.constraint(equalToConstant: 200),
            line.heightAnchor.constraint(equalToConstant: 1)
        ])
        //titleLabel
        mainImageView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: mainImageView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: -30),
            titleLabel.bottomAnchor.constraint(equalTo: mainImageView.bottomAnchor, constant: -55),
            titleLabel.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor)
        ])
        //typeLabel
        scrollView.addSubview(typeLabel)
        NSLayoutConstraint.activate([
            typeLabel.centerYAnchor.constraint(equalTo: mainImageView.bottomAnchor),
            typeLabel.centerXAnchor.constraint(equalTo: mainImageView.centerXAnchor)
        ])
        //close button
        //MARK: fix close button and gradient
        scrollView.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -25),
            closeButton.heightAnchor.constraint(equalToConstant: 40),
            closeButton.widthAnchor.constraint(equalToConstant: 40)
        ])
        
        let gradientLayer: CAGradientLayer = {
            let gradientLayer = CAGradientLayer()
            gradientLayer.frame = mainImageView.bounds
            gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
            gradientLayer.locations = [0.51, 1.0]
            return gradientLayer
        }()
        mainImageView.layer.insertSublayer(gradientLayer, at: 0)
        
        
        
        
        
        
    }
    
    @objc func closeVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
}


