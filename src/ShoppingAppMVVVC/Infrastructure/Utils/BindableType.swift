//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 POC Software. All rights reserved.
//

import Foundation
import UIKit

protocol BindableType: AnyObject {
    associatedtype ViewModelType

    var viewModel: ViewModelType! { get set }

    func setUpBindings()
}

extension BindableType where Self: UIViewController {
    func bind(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        setUpBindings()
    }
}

extension BindableType where Self: UITableViewCell {
    func bind(to model: Self.ViewModelType) {
        viewModel = model
        setUpBindings()
    }
}

extension BindableType where Self: UICollectionViewCell {
    func bind(to model: Self.ViewModelType) {
        viewModel = model
        setUpBindings()
    }
}