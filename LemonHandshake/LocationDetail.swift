//
//  LocationView.swift
//  LemonHandshake
//
//  Created by Jhantelle Belleza on 11/22/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import UIKit
import SnapKit

class LocationDetail: UIView {
    
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var propertyTypeIcon: UIImageView!
    @IBOutlet weak var propertyPreview: UIImageView!
    
    var location: Location! {
        didSet {
            nameLabel.text = location.name
            addressLabel.text = location.address
            propertyTypeIcon.image = location.icon
            print("Inside /(location)")
        }
    }
    
    @IBOutlet weak var headerLabel: UILabel!
    override init(frame: CGRect) { //Create programatically
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) { //Create via storyboard
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        Bundle.main.loadNibNamed("LocationDetail", owner: self, options: nil)
        addSubview(contentView)
        
        contentView.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.leftAnchor.constraint(equalTo: leftAnchor).isActive = true
        contentView.rightAnchor.constraint(equalTo: rightAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        
        nameLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView)
        }
        
        addressLabel.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(20, 20, 20, 20))
        }
 
        propertyTypeIcon.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(20, 20, 20, 20))
        }
        
        propertyPreview.snp.makeConstraints { (make) in
            make.edges.equalTo(contentView).inset(UIEdgeInsetsMake(20, 20, 20, 20))
        }
        
    }
    
}