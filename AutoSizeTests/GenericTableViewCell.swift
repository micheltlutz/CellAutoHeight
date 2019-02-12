//
//  GenericTableViewCell.swift
//  AutoSizeTests
//
//  Created by Michel Anderson Lutz Teixeira on 12/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class GenericTableViewCell<View: UIView>: UITableViewCell {
    var cellView: View? {
        didSet {
            guard cellView != nil else { return }
            setUpViews()
        }
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        backgroundColor = .white
        //backgroundColor = .backgroundColor // from StyleGuide
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setUpViews() {
        guard let cellView = cellView else { return }
        addSubview(cellView)
//        contentView.addSubview(cellView)
        setNeedsDisplay()
        cellView.pinEdgesToSuperview()
    }
}
