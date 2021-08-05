//
// 📰 🐸 
// Project: RSSchool_T9
// 
// Author: Andrew Pokachailo
// On: 8/5/21
// 
// Copyright © 2021 RSSchool. All rights reserved.

import Foundation

extension DetailViewController {
    func setDetails(index: Int) -> UIViewController {
        switch item[index] {
        case .gallery(let gallery):
            let vc = GalleryViewController()
            vc.setComponents(component: gallery)
            return vc
        case .story(let story):
            let vc = StoryViewController()
            vc.setComponents(component: story)
            return vc
        }
    }
}
