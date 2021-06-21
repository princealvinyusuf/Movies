//
//  FilterRowTableViewCell.swift
//  Movies
//
//  Created by Prince Alvin Yusuf on 20/06/2021.
//  Copyright © 2021 Prince Alvin Yusuf. All rights reserved.
//

import UIKit

class FilterRowTableViewCell: UITableViewCell {
    let filterType: FilterType
    
    init(filterType: FilterType) {
        self.filterType = filterType
        super.init(style: .value1, reuseIdentifier: FilterRowTableViewCell.identifier)
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
