//
//  ViewController.swift
//  TableViews
//
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    private let myCountries = ["Colombia", "España", "Perú", "EEUU", "Argentina", "México", "Chile"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
  
        
        tableView.register(UINib(nibName: "MyCustomTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
    }

}
//MARK - UITableViewDataSource

extension ViewController: UITableViewDataSource {
    
    // Crear cabeceras
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Celdas Simples"
        }
        return "Celdas Custom"
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        if section == 0 {
        return "Footer para celdas simples"
        }
        return "Footer para celdas Custom"
    }
    
    //Definir el contenido de cada una de las celdas
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
        
   // Recuperar una celda reutilizable
        var cell = tableView.dequeueReusableCell(withIdentifier: "myCell")
        if cell == nil {
         cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
            cell?.backgroundColor = .lightGray
            cell?.textLabel?.font = UIFont.systemFont(ofSize: 30)
            cell?.accessoryType = .disclosureIndicator
        }
        cell?.textLabel?.text = myCountries[indexPath.row]
        return cell!
            
        } 
            let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyCustomTableViewCell
            
            cell?.myFirstLabel.text = String(indexPath.row + 1)
            cell!.mySecondLabel.text = myCountries[indexPath.row]
        
        if indexPath.row == 2 {
            cell?.mySecondLabel.text = "fsdewfsdewjbhjkbhbjbkjlkjoljknjvgcfxdsxredxrfxcfcfvhbjnkm"
        }
            
            return cell!
        
    }
    
    //Indica numero de celdas de la tabla
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myCountries.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    //Indica ancho de la celda
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 50
        }
        return UITableView.automaticDimension
    }
        
    }

// MARK: - UITableViewDelegate
extension ViewController: UITextViewDelegate {
    
    func tableView( tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(myCountries[indexPath.row])
    }
}
