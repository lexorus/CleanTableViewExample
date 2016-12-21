//
//  TableViewCellDescriper.swift
//  CleanTableViewExample
//
//  Created by Dmitrii Celpan on 12/13/16.
//  Copyright © 2016 lexorus. All rights reserved.
//

import CoreGraphics

protocol TableCellRepresentable {
    var height: CGFloat { get set }
    var identifier: String { get set }
    var type: Settable.Type { get }
    var data: CellData { get set }
    init<T: CellData>(withData data: T)
}

protocol Settable: class {
    func populate(data: CellData)
}

protocol CellData { }
