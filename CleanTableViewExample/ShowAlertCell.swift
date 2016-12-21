//
//  ShowAlertCell.swift
//  CleanTableViewExample
//
//  Created by Dmitrii Celpan on 12/12/16.
//  Copyright © 2016 lexorus. All rights reserved.
//

import UIKit

private let ShowAlertCellIdentifier = "ShowAlertCell"

final class ShowAlertCell: UITableViewCell, Setable {
    var showAlertButtonAction: ((String) -> ())?
    
    @IBOutlet weak var inputTextField: UITextField!
    
    @IBAction func showAlertButtonPressed(_ sender: UIButton) {
        showAlertButtonAction?(inputTextField.text ?? "")
    }
    
    func populate(data: CellData) {
        guard let cellData = data as? ShowAlertCellData else {
            return
        }
        showAlertButtonAction = cellData.showAlertButtonAction
    }
    
}

final class ShowAlertCellModel: TableCellRepresentable {
    var height: CGFloat = 94
    var identifier = ShowAlertCellIdentifier
    var type: Setable.Type {
        return ShowAlertCell.self
    }
    var data: CellData
    
    init<T: CellData>(withData data: T) {
        self.data = data
    }
    
}

struct ShowAlertCellData: CellData {
    let showAlertButtonAction: (String) -> ()
}
