//
//  TableViewController.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import UIKit

//let url = "https://fruityvice.com/api/fruit/all"
class TableViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    
    let tableViewControllerViewModel = TableViewControllerViewModel(anyManager: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
//        tableViewControllerViewModel.reloadTableView = {
//            DispatchQueue.main.async {
//                self.tableView.reloadData()
//            }
//        }
        tableViewControllerViewModel.getFruitsDetailsWithClosure(url: "https://fruityvice.com/api/fruit/all") {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

}

extension TableViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return  tableViewControllerViewModel.fruits.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.delegate = self
        cell.tag = indexPath.row
        let fruit = tableViewControllerViewModel.fruits[indexPath.row]
        
        cell.nameLabel1.text = "Name: \(fruit.name)"
        cell.familyLabel2.text = "Family: \(fruit.family)"
        cell.orderLabel3.text = "Order: \(fruit.order)"
        cell.carboydrateLabel5.text = "Carbohydrate: \(fruit.nutritions.carbohydrates)"
        cell.protienLabel6.text = "Protiens: \(fruit.nutritions.protein)"
        cell.fatLabel7.text = "Fat: \(fruit.nutritions.fat)"
        cell.caloriesLabel8.text = "Calories: \(fruit.nutritions.calories)"
        cell.sugarLabel9.text = "Sugar: \(fruit.nutritions.sugar)"
        return cell
    }
}

extension TableViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}


extension TableViewController : TableViewCellDelegate{
    func handleButtonClickedInTableViewCell(tag: Int) {
        print(tag)
    }
}
