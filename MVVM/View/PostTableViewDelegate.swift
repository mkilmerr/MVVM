//
//  PostTableViewDelegate.swift
//  MVVM
//
//  Created by Marcos Kilmer Pereira de Aquino on 10/11/21.
//

import UIKit

class PostTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }
}
