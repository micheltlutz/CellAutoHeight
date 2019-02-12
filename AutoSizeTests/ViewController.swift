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
        tableView.estimatedRowHeight = UITableView.automaticDimension
        tableView.register(GenericTableViewCell<ExpanderContent>.self, forCellReuseIdentifier: cellId)
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
        tableView.reloadData()
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableView.estimatedRowHeight
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return labelsItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId,
                                                       for: indexPath) as? GenericTableViewCell<ExpanderContent> else {
            return UITableViewCell()
        }
        let view = labelsItems[indexPath.row]
        view.addTapGestureRecognizer {
            view.updateTexts()
            let hmm = indexPath
//            print("Index: \(hmm)")
            self.tableView.reloadRows(at: [hmm], with: UITableView.RowAnimation.automatic)

//            self.tableView.reloadData()
            view.setNeedsLayout()
        }
        cell.cellView = view
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
