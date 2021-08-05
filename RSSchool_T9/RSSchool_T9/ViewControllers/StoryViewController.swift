//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 8/5/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class StoryViewController: DetailViewController {
    
    let textLabel: UITextView = {
        let textLabel = UITextView()
        textLabel.isScrollEnabled = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.backgroundColor = .black
        textLabel.layer.cornerRadius = 8
        textLabel.layer.borderWidth = 1
        textLabel.layer.borderColor = UIColor.white.cgColor
        textLabel.textContainerInset = UIEdgeInsets(top: 30, left: 30, bottom: 30, right: 40)
        textLabel.font = UIFont(name: "Rockwell-Regular", size: 24)
        textLabel.textColor = .white
        return textLabel
    }()
    
    let pathScrollView: UIScrollView = {
        let flowLayout = UICollectionViewFlowLayout()
        let pathScrollView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.scrollDirection = .horizontal
        pathScrollView.translatesAutoresizingMaskIntoConstraints = false
        pathScrollView.showsHorizontalScrollIndicator = false
        pathScrollView.backgroundColor = .black
        pathScrollView.layer.cornerRadius = 8
        pathScrollView.layer.borderWidth = 1
        pathScrollView.layer.borderColor = UIColor.white.cgColor
        return pathScrollView
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        setupStory()
    }
    
    
    func setupStory() {
        scrollView.addSubview(pathScrollView)
        NSLayoutConstraint.activate([
            pathScrollView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40),
            pathScrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            pathScrollView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            pathScrollView.centerXAnchor.constraint(equalTo: line.centerXAnchor),
            pathScrollView.heightAnchor.constraint(equalToConstant: 100)
        ])
        scrollView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: pathScrollView.bottomAnchor, constant: 40),
            textLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            textLabel.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            textLabel.centerXAnchor.constraint(equalTo: pathScrollView.centerXAnchor),
            textLabel.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
    }
    
    func setComponents(component: Story) {
        mainImageView.image = component.coverImage
        typeLabel.text = component.type
        titleLabel.text = component.title
        textLabel.text = component.text
    }
    
}
