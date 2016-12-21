# CleanTableViewExample
The example of how to organize the table view in a clean way.

If you are familiar with the next code, than this set of protocols may help you:

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Some code
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath)
        
        if let cell = cell as? FirstTypeCellCell {
            // Do something
        }
        
        if let cell = cell as? SecondTypeCellCell {
            // Do something
        }
        
        if let cell = cell as? ThirdTypeCell {
            // Do something
        }
        
        return cell
    }

Here are used the next protocols to make work with UITableViewCell’s more abstract: 

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

So the data source functions with look in the next way:

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellModel = tableViewCells[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: cellModel.identifier, for: indexPath)
        (cell as? Settable)?.populate(data: cellModel.data)
        
        return cell
    }

This will also work for the other delegate/data source function. You are free to extend this protocols to make your life easier.
