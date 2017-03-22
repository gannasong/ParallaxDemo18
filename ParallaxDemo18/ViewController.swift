//
//  ViewController.swift
//  ParallaxDemo18
//
//  Created by SUNG HAO LIN on 2017/3/22.
//  Copyright © 2017年 GanNaSong. All rights reserved.
//

import UIKit

class ViewController: UIViewController ,UITableViewDelegate, UITableViewDataSource{
    
    //連接tableview out
    @IBOutlet weak var tableView: UITableView!
    
    var titles = ["柬埔寨 吳哥窟","澳洲 大堡礁", "秘魯 馬丘比丘", "中國 萬里長城", "印度 泰姬瑪哈陵", "美國 大峽谷", "羅馬 羅馬競技場"]
    
    var images : [UIImage] = [
        UIImage(named: "view01")!,
        UIImage(named: "view02")!,
        UIImage(named: "view03")!,
        UIImage(named: "view04")!,
        UIImage(named: "view05")!,
        UIImage(named: "view06")!,
        UIImage(named: "view07")!
    ]
    
    
    
    var parallaxOffsetSpeed:CGFloat = 50
    var cellHight:CGFloat = 250
    
    
    
    var parallaxImageHeight:CGFloat {
    let maxOffset = (sqrt(pow(cellHight , 2) + 4 * parallaxOffsetSpeed * self.tableView.frame.height) - cellHight) / 2

        return maxOffset + self.cellHight
    }
    
    
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titles.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "imageCell") as? imageCell {
               cell.configureCell(title: titles[indexPath.row], image: images[indexPath.row])
            
            cell.parallaxImageHeight.constant = self.parallaxImageHeight
            cell.parallaxTopConstraint.constant = parallaxOfset(newOffsetY: tableView.contentOffset.y, cell: cell)
            
               return cell
        } else {
               return imageCell()
        }
       
    }
    
    
    
    
    func parallaxOfset(newOffsetY:CGFloat, cell: UITableViewCell) -> CGFloat {
        
        return (newOffsetY - cell.frame.origin.y) / parallaxImageHeight * parallaxOffsetSpeed
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = tableView.contentOffset.y
        for cell in tableView.visibleCells as! [imageCell] {
            cell.parallaxTopConstraint.constant = parallaxOfset(newOffsetY: tableView.contentOffset.y, cell: cell)
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //delegate跟dataSource如果用打的外面就不用連
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

