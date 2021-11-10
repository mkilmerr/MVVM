//
//  PostDataSource.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 09/11/21.
//

import UIKit

class PostTableViewDataSource<CELL: UITableViewCell, T>: NSObject, UITableViewDataSource {
    
    public var cellIdentifier: String
    public var items: Array<T>
    public var configureCell: (CELL, T) -> () = {_,_ in }
    
    init(cellIdentifier: String, items: Array<T>, configureCell: @escaping  (CELL, T) -> () ) {
        self.cellIdentifier = cellIdentifier
        self.configureCell = configureCell
        self.items = items
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? CELL {
            let item = items[indexPath.row]
            self.configureCell(cell, item)
            return cell
        }
        
        return UITableViewCell()
    }
}
