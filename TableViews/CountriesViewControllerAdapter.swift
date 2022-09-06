//
//  CountriesViewControllerAdapter.swift
//  TableViews
//
//  Created by Wilson David Molina Lozano on 6/09/22.
//

import UIKit

class CounstriesViewControllerAdapter: NSObject {
    
    typealias Layout = ViewControllersLayout
    typealias Constants = ViewControllerContants
    
    var favoriteCountries: [String] = []
    
}

// MARK - UITableViewDataSource
extension CounstriesViewControllerAdapter: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        favoriteCountries.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            return simpleCell(at: indexPath, for: tableView)
        }
        return customCell(at: indexPath, tableView: tableView)
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return Constants.firstHeaderTitle
        }
        return Constants.secondHeaderTitle
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
            return "Footer para celdas simples"
        }
        return "Footer para celdas Custom"
    }
    
}

// MARK - UITableViewDelegate
extension CounstriesViewControllerAdapter: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(favoriteCountries[indexPath.row])
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        Layout.heightForHeaderInSection
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        50
    }
    
}

// MARK: - This methods are called in the UITableViewDataSource
extension CounstriesViewControllerAdapter {
    
    func simpleCell(at indexPath: IndexPath, for tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "myCell") else {
            return UITableViewCell()
        }
        cell.backgroundColor = .lightGray
        cell.textLabel?.font = UIFont.systemFont(ofSize: 30)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = favoriteCountries[indexPath.row]
        return cell
    }
    
    func customCell(at indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyCustomTableViewCell else {
            return UITableViewCell()
        }
            
        cell.myFirstLabel.text = String(indexPath.row + 1)
        cell.mySecondLabel.text = favoriteCountries[indexPath.row]
        
        if indexPath.row == 2 {
            cell.mySecondLabel.text = "fsdewfsdewjbhjkbhbjbkjlkjoljknjvgcfxdsxredxrfxcfcfvhbjnkm"
        }
        
        return cell
    }
}
