//
//  imageCell.swift
//  ParallaxDemo18
//
//  Created by SUNG HAO LIN on 2017/3/22.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit

class imageCell: UITableViewCell {

    

    @IBOutlet weak var parallaxImage: UIImageView!
    @IBOutlet weak var imageTitle: UILabel!
    
    //拉外面image的constraint高進來
    @IBOutlet weak var parallaxImageHeight: NSLayoutConstraint!
    //拉外面top constraint進來
    @IBOutlet weak var parallaxTopConstraint: NSLayoutConstraint!
    override func awakeFromNib() {
        super.awakeFromNib()
        
        parallaxImage.clipsToBounds = true
        
        
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureCell(title:String, image: UIImage) {
        
        self.imageTitle.text = title
        self.parallaxImage.image = image
    }
    
    
    
    
    
    
}
