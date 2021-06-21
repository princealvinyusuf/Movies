//
//  ReusableView.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit

protocol Identifiable: AnyObject {}

extension Identifiable where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

extension Identifiable where Self: UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}

extension Identifiable where Self: BaseTableViewHeaderFooterView {
    static var identifier: String {
        return String(describing: self)
    }
}
