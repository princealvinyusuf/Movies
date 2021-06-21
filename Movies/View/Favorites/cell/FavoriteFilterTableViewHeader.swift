//
//  FavoriteFilterTableViewHeader.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit

class FavoriteFilterTableViewHeader: BaseTableViewHeaderFooterView, CellHeight {
    
    static var height: CGFloat {
        return 60
    }
    
    var hasFilter: Bool = false {
        didSet {
            let title = hasFilter ? "Edit filter" : "Add filter"
            btn.setTitle(title, for: .normal)
        }
    }
    var onFilterPressed: (() -> ())?
    
    private lazy var btn: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Add filter", for: .normal)
        btn.addTarget(self, action: #selector(onFilterButtonPressed), for: .touchUpInside)
        btn.contentEdgeInsets = .init(top: 8, left: 8, bottom: 8, right: 8)
        btn.tintColor = Config.blue
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        return btn
    }()

    override func setupViews() {
        super.setupViews()
        
        contentView.backgroundColor = Config.black
        contentView.addSubview(btn)
        btn.fillSuperview()
    }
}

// MARK: Actions
extension FavoriteFilterTableViewHeader {
    @objc private func onFilterButtonPressed() {
        onFilterPressed?()
    }
}
