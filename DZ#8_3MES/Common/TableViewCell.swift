//
//  TableViewCell.swift
//  DZ#8_3MES
//
//  Created by Nurlan Seitov on 12/3/23.
//

import UIKit

class TableViewCell: UITableViewCell {

   
    @IBOutlet weak var imageViewtable: UIImageView!
    
    @IBOutlet weak var labelTable1: UILabel!
    
    @IBOutlet weak var labelTable2: UILabel!
    
    public func initUI(name1: String,name2:String, image: String) {
        labelTable1.text = name1
        labelTable2.text = name2
        imageViewtable.image = UIImage(named: image)
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
