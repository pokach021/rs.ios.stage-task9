//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 8/5/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryViewController: DetailViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    var images = [UIImage]()
    
    let collectionView: UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.backgroundColor = .cyan
        flow.scrollDirection = .vertical
        collectionView.isScrollEnabled = false
        return collectionView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setup()
        self.setupGallery()
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "GalleryCell")
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setupGallery() {
        scrollView.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: line.bottomAnchor, constant: 40),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            collectionView.centerXAnchor.constraint(equalTo: line.centerXAnchor),
            collectionView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -30)
        ])
    }
    
    
    func setComponents(component: Gallery) {
        mainImageView.image = component.coverImage
        typeLabel.text = component.type
        titleLabel.text = component.title
        images = component.images
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "GalleryCell", for: indexPath) as! GalleryCollectionViewCell
        cell.configure(images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 150
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var cgsize = CGSize()
        if view.bounds.height > view.bounds.width {
            cgsize = CGSize(width: view.bounds.width - 40, height: (view.bounds.width - 40) * 1.37)
        }
        if view.bounds.width > view.bounds.height {
            cgsize = CGSize(width: (view.bounds.height - 40), height: (view.bounds.height - 40) * 1.37)
        }
        return cgsize
    }
}
