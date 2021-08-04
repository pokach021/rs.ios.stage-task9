//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 8/2/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    var setupNumber: Int
    var images = [UIImage]()
    let contentType = FillingData.data
    var titleStr = ""
    var mainImage = UIImage()
    var mainTitle = ""
    var text = ""
    
    
    let closeButton: UIButton = {
        let closeButton = UIButton()
        closeButton.tintColor = .white
        closeButton.layer.cornerRadius = 20
        closeButton.setImage(UIImage(systemName: "xmark"), for: .normal)
        closeButton.layer.borderWidth = 1
        closeButton.layer.borderColor = UIColor.white.cgColor
        closeButton.translatesAutoresizingMaskIntoConstraints = false;
        closeButton.addTarget(self, action: #selector(closeVC(_:)), for: .touchUpInside)
        return closeButton
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    func setContetntType() {
        let content = contentType[setupNumber]
        
        switch content {
        case .gallery(let gallery):
            images = gallery.images
            mainImage = gallery.coverImage
            mainTitle = gallery.title
            titleStr = "Gallery"
        case .story(let story):
            mainImage = story.coverImage
            mainTitle = story.title
            text = story.text
            titleStr = "Story"
        }

    }
    
    func setupVC() {
        // self.navigationController?.isNavigationBarHidden = true
        // self.tabBarController?.tabBar.isHidden = true
        self.view.backgroundColor = .black
        // collectionView
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        //collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(GalleryCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCellid")
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: view.bounds.width),
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        collectionView.addSubview(closeButton)
        NSLayoutConstraint.activate([
            closeButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 30),
            closeButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -(self.view.bounds.width * 0.06)),
            closeButton.heightAnchor.constraint(equalToConstant: self.view.bounds.width * 0.097),
            closeButton.widthAnchor.constraint(equalToConstant: self.view.bounds.width * 0.097)
        ])
        
        
        
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        var result = 0
        if section == 0 {
            result = 1
        } else if section == 1 {
            result = images.count
        }
        return result
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellid", for: indexPath) as! GalleryCollectionViewCell
        
        let section = indexPath.section
        if section == 0 {
            cell.mainTitleStr = titleStr
            cell.mainImageView.image = mainImage
            cell.mainTitle.text = mainTitle
            cell.setupFirstSection()
        } else if section == 1 {
            if titleStr == "Story" {
                cell.setupSecondSectionStory()
                cell.text = text
            } else {
                cell.mainImageView.image = images[indexPath.row]
                cell.setupSecondSection()
            }
            
        }
        
        return cell
    }
    
    @objc func closeVC(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width * 0.9, height: (self.view.frame.width * 1.2))
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if UIDevice.current.orientation.isPortrait {
            return self.view.bounds.height * 0.04
        }else {
            return self.view.bounds.width * 0.04
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if section == 0 {
            return UIEdgeInsets(top: 100, left: 0, bottom: 100, right: 0)
        }
        return .zero
    }
    
    init(number: Int) {
        self.setupNumber = number
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //    func setupScrollView() {
    //        self.view.addSubview(scrollView)
    //        scrollView.frame = CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height)
    //
    //    }
    //
    //    func setup(index: Int) {
    //        mainImageView.layer.borderWidth = 1
    //        mainImageView.layer.borderColor = UIColor.white.cgColor
    //        mainImageView.layer.cornerRadius = 8
    //        mainImageView.contentMode = .scaleAspectFill
    //        mainImageView.clipsToBounds = true
    //        scrollView.addSubview(mainImageView)
    //        mainImageView.frame = CGRect(x: 20, y: 100, width: 374, height: 500)
    //
    //        let gradientLayer = CAGradientLayer()
    //        gradientLayer.frame = mainImageView.bounds
    //        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.black.cgColor]
    //        gradientLayer.locations = [0.51, 1.0]
    //        mainImageView.layer.insertSublayer(gradientLayer, at: 0)
    //
    //
    //        switch FillingData.data[index]{
    //        case .story(let story):
    //            mainImageView.image = story.coverImage
    //            mainTitle.text = story.title
    //        case .gallery(let gallery):
    //            mainImageView.image = gallery.coverImage
    //            mainTitle.text = gallery.title
    //            images = gallery.images
    //        }
    //    }
    //
    
    
    
}
