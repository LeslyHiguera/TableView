//
//  ViewController.swift
//  TableViews
//
//

import UIKit

class ViewController: UIViewController {
    
    typealias Layout = ViewControllersLayout
    
    // MARK: - IBOutlets
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Private Properties
    
    private let myCountries = ["Colombia", "España", "Perú", "EEUU", "Argentina", "México", "Chile"]
    private let adapter = CounstriesViewControllerAdapter()
    
    // MARK: - UIViewController Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = adapter
        tableView.delegate = adapter
        
        adapter.favoriteCountries = myCountries
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "myCell")
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }
    
}
