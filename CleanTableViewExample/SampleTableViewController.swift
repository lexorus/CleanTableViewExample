//
//  SampleTableViewController.swift
//  CleanTableViewExample
//
//  Created by Dmitrii Celpan on 12/12/16.
//  Copyright © 2016 lexorus. All rights reserved.
//

import UIKit

final class SampleTableViewController: UITableViewController {
    
    private var tableViewBuilder: TableViewBuilder!
    var tableViewCells: [TableCellRepresentable] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewBuilder =
            TableViewBuilder(changeColorButtonAction: changeColorButtonAction,
                             showAlertButtonAction: showAlertButtonAction)
        tableViewCells = tableViewBuilder.composeCellsWithWhiteColorForSetableCell()
    }
    
    // Cells functions
    
    private func changeColorButtonAction() {
        tableViewCells = tableViewBuilder.composeCellsWithRandomColorForSetableCell()
        tableView.reloadData()
    }
    
    private func showAlertButtonAction(text: String) {
        let alertController = UIAlertController(title: "Alert",
                                                message: text,
                                                preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "Nice",
                                                style: .cancel,
                                                handler: nil))
        self.present(alertController, animated: true, completion: nil)
    }

    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewCells.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return tableViewCells[indexPath.row].height
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = tableViewCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath)
        (cell as? Setable)?.populate(data: cellModel.data)
        
        return cell
    }
    
}
