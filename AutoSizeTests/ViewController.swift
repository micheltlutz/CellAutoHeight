//
//  ViewController.swift
//  AutoSizeTests
//
//  Created by Michel Anderson Lutz Teixeira on 12/02/19.
//  Copyright © 2019 Michel Anderson Lutz Teixeira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: UITableView.Style.grouped)
        return tableView
    }()

    var labelsItems: [ExpanderContent] = []
    let cellId = "loren_cell"
    override func viewDidLoad() {
        super.viewDidLoad()
      
        tableView.delegate = self
        tableView.dataSource = self
      
        // O automaticDimension tem q ser no row height e não no estimated =]
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
      
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
      
        loadData()
        setupViewConfiguration()
    }

    func loadData() {
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        labelsItems.append(ExpanderContent())
        tableView.reloadData()
    }
}


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelsItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
//                                                       for: indexPath) as? GenericTableViewCell<ExpanderContent> else {
//            return UITableViewCell()
//        }

        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)


        let view = labelsItems[indexPath.row]
        view.addTapGestureRecognizer {
            view.updateTexts()
//            self.tableView.reloadRows(at: [indexPath], with: UITableView.RowAnimation.automatic)
//            self.tableView.reloadData()
            cell.setNeedsLayout()
            UIView.performWithoutAnimation {
                tableView.beginUpdates()
                tableView.endUpdates()
            }
        }
//        cell.cellView = view
        cell.addSubview(view)
        view.pinEdgesToSuperview()
//        cell.layoutIfNeeded()
        return cell
    }
}

extension ViewController: ViewConfiguration {
    func setupConstraints() {
        tableView.pinEdgesToSuperview()
    }

    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
}
