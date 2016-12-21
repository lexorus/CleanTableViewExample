//
//  TableViewBuilder.swift
//  CleanTableViewExample
//
//  Created by Dmitrii Celpan on 12/13/16.
//  Copyright © 2016 lexorus. All rights reserved.
//

import Foundation
import UIKit

final class TableViewBuilder {
    let changeColorButtonAction: () -> ()
    let showAlertButtonAction: (String) -> ()
    
    init(changeColorButtonAction: @escaping (() -> ()),
         showAlertButtonAction: @escaping ((String) -> ())) {
        self.changeColorButtonAction = changeColorButtonAction
        self.showAlertButtonAction = showAlertButtonAction
    }
    
    //thumbs-down-sign
    
    func composeCellsWithWhiteColorForSettableCell() -> [TableCellRepresentable] {
        return composeCellsWithColorForSettableCell(color: .white)
    }
    
    func composeCellsWithRandomColorForSettableCell() -> [TableCellRepresentable] {
        return composeCellsWithColorForSettableCell(color: UIColor.random)
    }
    
    func composeCellsWithColorForSettableCell(color: UIColor) -> [TableCellRepresentable] {
        let labelAndImagesCellData =
            LabelAndImagesCellData(leftImage: UIImage(named: "thumbs-down-sign")!,
                                   rightImage: UIImage(named: "thumbs-up-sign")!,
                                   title: "Some title")
        let labelAndImagesCellModel =
            LabelAndImagesCellModel(withData: labelAndImagesCellData)
        
        let changeColorButtonCellData =
            ChangeColorButtonCellData(backgroundColor: color,
                                      changeColorButtonAction: changeColorButtonAction)
        let changeColorButtonCellModel =
            ChangeColorButtonCellModel(withData: changeColorButtonCellData)
        
        let showAlertCellData =
            ShowAlertCellData(showAlertButtonAction: showAlertButtonAction)
        let showAlertCellModel =
            ShowAlertCellModel(withData: showAlertCellData)
        
        
        return [labelAndImagesCellModel,
                changeColorButtonCellModel,
                showAlertCellModel]
    }
    
}

private extension UIColor {
    static var random: UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}

private extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
