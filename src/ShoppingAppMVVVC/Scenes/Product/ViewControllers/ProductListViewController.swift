//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import UIKit

class ProductListViewController:
        UIViewController,
        UICollectionViewDataSource,
        UICollectionViewDelegate,
        UICollectionViewDelegateFlowLayout,
        BindableType{

    // MARK: - Views
    private weak var collectionView: UICollectionView!

    // MARK: - Stored properties
    var viewModel: ProductListViewModel!
    private let productService =  ProductServiceMock()
    private var productList: [ProductModel] = []
    private let formatter = Formatter()
    private let itemsPerRow = 2


    override func loadView() {
        super.loadView()

        configureCollectionView()
    }

    // MARK: - Overrides
    override func viewDidLoad() {
        super.viewDidLoad()

        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self

        self.collectionView.register(ProductViewCell.self, forCellWithReuseIdentifier: "ProductViewCell")
        self.productList = self.productService.getList()
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.productList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductViewCell", for: indexPath) as! ProductViewCell
        let indexRow = indexPath.row
        let product = self.productList[indexRow]
        let priceText = self.formatter.formatPrice(from: product.price as NSNumber)
        cell.setProductData(from: product, priceText: priceText)
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(indexPath.row + 1)
        let product = productList[indexPath.row]
        self.productSelected(product: product)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {

        //return CGSize(width: collectionView.bounds.size.width - 16, height: 180)
        //320
        return CGSize(width: 148, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(self.productList.count)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return CGFloat(itemsPerRow)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 8, left: 8, bottom: 8, right: 8)
    }

    // MARK: - BindableType

    func setUpBindings() {
        guard let viewModel = self.viewModel else {
            return
        }
        configureNavBar(title: viewModel.title)

    }

    // Mark: - Helpers

    private func configureCollectionView() {
        let collectionLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)

        //collectionView.alignToSafeArea(to: self.view)


        collectionView.snp.makeConstraints { maker in
            maker.top.equalTo(self.view)
            maker.bottom.equalTo(self.view)
            maker.left.equalTo(self.view)
            maker.right.equalTo(self.view)
        }

/*
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor),
        ])
        */

    /*
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        */

        self.collectionView = collectionView
        collectionLayout.itemSize = CGSize(width: 150, height: 150)
    }

    private func configureNavBar(title: String) {
        self.title = title
    }

    private func productSelected(product: ProductModel){
        self.viewModel .selectProduct(product: product)
    }
}
