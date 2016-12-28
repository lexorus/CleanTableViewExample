//
//  LabelAndImagesCell.swift
//  CleanTableViewExample
//
//  Created by Dmitrii Celpan on 12/12/16.
//  Copyright © 2016 lexorus. All rights reserved.
//

import UIKit

private let LabelAndImagesCellIdentifier = "LabelAndImagesCell"

final class LabelAndImagesCell: UITableViewCell, Settable {
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func populate(data: CellData) {
        guard let cellData = data as? LabelAndImagesCellData else {
            return
        }
        leftImageView.image = cellData.leftImage
        rightImageView.image = cellData.rightImage
        titleLabel.text = cellData.title
    }
    
}

final class LabelAndImagesCellModel: TableCellRepresentable {
    var height: CGFloat = 62
    var identifier: String = LabelAndImagesCellIdentifier
    var type: Settable.Type {
        return LabelAndImagesCell.self
    }
    var data: CellData
    
    init<T: CellData>(withData data: T) {
        self.data = data
    }
    
}

struct LabelAndImagesCellData: CellData {
    let leftImage: UIImage
    let rightImage: UIImage
    let title: String
}
