//
//  TableViewCellDescriper.swift
//  CleanTableViewExample
//
//  Created by Dmitrii Celpan on 12/13/16.
//  Copyright © 2016 lexorus. All rights reserved.
//

import CoreGraphics

protocol TableViewCellDescriber {
    var height: CGFloat { get set }
    var cellIdentifier: String { get set }
    var cellClass: Setable.Type { get }
    var data: CellData { get set }
    init<T: CellData>(withData data: T)
}

protocol Setable: class {
    func populate(data: CellData)
}

protocol CellData { }
