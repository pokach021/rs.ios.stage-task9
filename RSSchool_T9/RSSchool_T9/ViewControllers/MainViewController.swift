//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 7/28/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import UIKit

class MainViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    let collectionView = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupVC()
    }
    
    func setupVC() {
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = .white
        // collectionView
        self.view.addSubview(self.collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        collectionView.showsVerticalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(MainCollectionViewCell.self, forCellWithReuseIdentifier: "CollectionCellid")
        
        NSLayoutConstraint.activate([
            collectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            collectionView.widthAnchor.constraint(equalToConstant: view.bounds.width - 40),
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 40),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FillingData.data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellid", for: indexPath) as! MainCollectionViewCell
        cell.setup(index: indexPath.row)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       // let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCellid", for: indexPath) as! MainCollectionViewCell
        let vc = GalleryViewController(number: indexPath.row)
        vc.setContetntType()
        vc.modalPresentationStyle = .fullScreen
        self.navigationController?.present(vc, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if UIDevice.current.orientation.isPortrait {
            return CGSize(width: self.view.frame.width * 0.43, height: (self.view.frame.width * 0.43) * 1.23)
        }else {
            return CGSize(width: self.view.frame.height * 0.43, height: (self.view.frame.height * 0.43) * 1.23)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        if UIDevice.current.orientation.isPortrait {
            return self.view.bounds.height * 0.034
        }else {
            return self.view.bounds.width * 0.034
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        if UIDevice.current.orientation.isPortrait {
            return self.view.bounds.width * 0.033
        }else {
            return self.view.bounds.height * 0.033
        }
    }
    
    
}
