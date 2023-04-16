//
//  TableViewCell.swift
//  MVVMPractice
//
//  Created by Aya Bassi on 13/04/2023.
//

import UIKit
protocol TableViewCellDelegate: AnyObject {
    func handleButtonClickedInTableViewCell(tag:Int)
}
class TableViewCell: UITableViewCell {
    
    var delegate: TableViewCellDelegate?
    
    @IBOutlet weak var nameLabel1: UILabel!
    @IBOutlet weak var familyLabel2: UILabel!
    @IBOutlet weak var orderLabel3: UILabel!
    @IBOutlet weak var nutritionLabel4: UILabel!
    @IBOutlet weak var carboydrateLabel5: UILabel!
    @IBOutlet weak var protienLabel6: UILabel!
    @IBOutlet weak var fatLabel7: UILabel!
    @IBOutlet weak var caloriesLabel8: UILabel!
    @IBOutlet weak var sugarLabel9: UILabel!
    
    @IBOutlet weak var buttonRef: UIButton!
    
    @IBAction func handleButtonClicked(_ sender: Any) {
        delegate?.handleButtonClickedInTableViewCell(tag: self.tag)
    }
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
