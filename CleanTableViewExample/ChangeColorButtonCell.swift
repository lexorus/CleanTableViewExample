//
//  ChangeColorButtonCell.swift
//  CleanTableViewExample
//
//  Created by Dmitrii Celpan on 12/12/16.
//  Copyright © 2016 lexorus. All rights reserved.
//

import UIKit

private let ChangeColorButtonCellIdentifier = "ChangeColorButtonCell"

final class ChangeColorButtonCell: UITableViewCell, Setable {
    var changeColorButtonAction: (() -> ())?
    
    func populate(data: CellData) {
        guard let cellData = data as? ChangeColorButtonCellData else {
            return
        }
        backgroundColor = cellData.backgroundColor
        changeColorButtonAction = cellData.changeColorButtonAction
    }
    
    @IBAction func changeColorButtonPressed(_ sender: UIButton) {
        changeColorButtonAction?()
    }
    
}

final class ChangeColorButtonCellModel: TableViewCellDescriber {
    var height: CGFloat = 76
    var cellIdentifier = ChangeColorButtonCellIdentifier
    var cellClass: Setable.Type {
        return ChangeColorButtonCell.self
    }
    var data: CellData
    
    init<T: CellData>(withData data: T) {
        self.data = data
    }
    
}

struct ChangeColorButtonCellData: CellData {
    let backgroundColor: UIColor
    let changeColorButtonAction: () -> ()
}
