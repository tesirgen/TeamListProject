//
//  BaseTableViewCell.swift
//  Week_4
//
//  Created by Tahir Esirgen on 14.10.2021.
//

import UIKit

class BaseTableViewCell : UITableViewCell{
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addMajorViews()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        addMajorViews()
        setupView()
    }
    
    func setupView() {
        
    }
    func addMajorViews() {
        
    }
    
    static var identifier:String{
        return String(describing: self)
    }
    
}
