//
//  UIImageView+Ext.swift
//  YassirMoviesTask
//
//  Created by Ibtikar on 26/01/2023.
//

import Kingfisher
import UIKit

extension UIImageView {
    func loadImageFromUrl(urlString: String,
                          placeHolderImage: UIImage?) {
        
        guard let url = URL(string: urlString) else {
            return
        }
        self.kf.setImage(
            with: url,
            placeholder: placeHolderImage)
    }
}
