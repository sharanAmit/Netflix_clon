//
//  TitleCollectionViewCell.swift
//  Netflix_clon
//
//  Created by Amit Sharan on 18/02/23.
//

import UIKit
import SDWebImage
class TitleCollectionViewCell: UICollectionViewCell {

    static let identifiers = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    required init?(coder: NSCoder){
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with model: String) {
// https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg
//        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)")
        guard let url = URL(string: "https://image.tmdb.org/t/p/w500/\(model)")
        else {
            return
        }

        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
}






























