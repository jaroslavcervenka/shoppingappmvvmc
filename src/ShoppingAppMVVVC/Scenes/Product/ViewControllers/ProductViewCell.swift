//
//  ProductViewCell.swift
//  ShoppingAppMVVVC
//
//  Created by Jaroslavc Cervenka on 06/09/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import UIKit
import Foundation
import Kingfisher
import SnapKit

class ProductViewCell: UICollectionViewCell {
    weak var imageView: UIImageView!
    weak var brandLabel: UILabel!
    weak var nameLabel: UILabel!
    weak var priceLabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: frame)

        //image
        let imageView = UIImageView()
        self.contentView.addSubview(imageView)
        imageView.snp.makeConstraints{(make) -> Void in
            make.top.equalToSuperview()
            make.left.equalToSuperview()
            make.right.equalToSuperview()
            make.height.equalTo(100)
        }
        self.imageView = imageView

        //brand
        let brandLabel = UILabel(frame: .zero)
        brandLabel.numberOfLines = 1
        brandLabel.textAlignment = .left
        brandLabel.translatesAutoresizingMaskIntoConstraints = false
        brandLabel.textColor = .gray
        brandLabel.font = UIFont(name: "Helvetica Neue", size: 12)
        self.contentView.addSubview(brandLabel)
        brandLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalToSuperview().offset(105)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        self.brandLabel = brandLabel

        //description
        let nameLabel = UILabel(frame: .zero)
        nameLabel.numberOfLines = 2
        nameLabel.textAlignment = .left
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont(name: "Helvetica Neue", size: 13)
        self.contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(brandLabel).offset(20)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        self.nameLabel = nameLabel

        //price
        let priceLabel = UILabel(frame: .zero)
        priceLabel.numberOfLines = 1
        priceLabel.textAlignment = .left
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.font = UIFont(name: "Helvetica Neue", size: 15)
        self.contentView.addSubview(priceLabel)
        priceLabel.snp.makeConstraints{(make) -> Void in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.equalToSuperview()
            make.right.equalToSuperview()
        }
        self.priceLabel = priceLabel

        //self.contentView.backgroundColor = .lightGray

    }

    func setProductData(from: ProductModel, priceText: String){
        let thumbnailUrl = UriFormatter.createImageThumbnailLink(from: from.imageUrl)
        let url = URL(string: thumbnailUrl)
        self.imageView.kf.setImage(with: url)
        self.brandLabel.text = from.brand
        self.nameLabel.text = from.name
        self.priceLabel.text = priceText
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        fatalError("Interface Builder is not supported!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()

        fatalError("Interface Builder is not supported!")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

        self.brandLabel.text = nil
    }
}
