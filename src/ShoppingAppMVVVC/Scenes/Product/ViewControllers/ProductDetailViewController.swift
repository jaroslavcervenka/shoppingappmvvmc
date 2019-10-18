//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import UIKit
import Kingfisher
import SnapKit
import RxSwift

class ProductDetailViewController:
        UIViewController,
        BindableType,
        Accessible{

    // MARK: - Views
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var brandLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var buyButton: UIButton!

    // MARK: - Stored properties
    var viewModel: ProductDetailViewModel!

    // MARK: - Private properties
    private let disposeBag = DisposeBag()
    private let spacing = 20

    // MARK: - Overrides
    override func viewDidLoad() {

        super.viewDidLoad()
    }

    // MARK: - BindableType
    func setUpBindings() {

        guard let viewModel = self.viewModel else {
            return
        }

        setValues(viewModel: viewModel)
        configureNavBar(title: viewModel.title)
    }

    private func setValues(viewModel: ProductDetailViewModel){

        let url = URL(string: viewModel.thumbnailUrl)
        self.imageView?.kf.setImage(with: url)
        self.brandLabel?.text = viewModel.brand
        self.nameLabel?.text = viewModel.name
        self.priceLabel.text = viewModel.formattedPrice
    }

    /*
    private func configureView(){

        let safeLayoutTop = self.view.safeAreaLayoutGuide.snp.top
        let safeLayoutLeft = self.view.safeAreaLayoutGuide.snp.left
        let safeLayoutRight = self.view.safeAreaLayoutGuide.snp.right

        if let imageView = self.imageView{
            imageView.snp.makeConstraints{(make) -> Void in
                make.top.equalTo(safeLayoutTop)
                make.left.equalTo(safeLayoutLeft).offset(spacing)
                make.right.equalTo(safeLayoutRight).offset(spacing)
                make.height.equalTo(350)
            }
        }

        if let buyButton = self.buyButton{
            buyButton.snp.remakeConstraints{(make) -> Void in
                //make.width.equalTo(44)
                make.top.equalToSuperview().offset(400)
                make.left.equalToSuperview().offset(spacing)
                make.right.equalToSuperview().offset(spacing)
                make.height.equalTo(44)
            }
        }
    }
    */

    private func configureNavBar(title: String) {
        self.title = title
    }
}
