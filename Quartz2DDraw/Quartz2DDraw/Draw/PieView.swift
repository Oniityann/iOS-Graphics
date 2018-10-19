//
//  PieView.swift
//  Quartz2DDraw
//
//  Created by Oniityann on 2018/9/9.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class PieView: UIView {

    var itemList = [PieItem]()
    
    var radius: CGFloat = 100.0
    var innerRadius: CGFloat = 33.0
    var clickedRadius: CGFloat = 110.0
    var sliceSpace: CGFloat = 0
    
    private var selectedIndex = -1;
    
    func draw(with itemList: [PieItem]) {
        if itemList.isEmpty {
            return
        }
        
        let context = UIGraphicsGetCurrentContext()
        
        let deg2Rad = CGFloat(Double.pi / 180.0)
        
        // 起始弧度
        let rotationAngle = CGFloat(270.0) * deg2Rad
        let angle: CGFloat = 0.0
        let index = 0
        
        for item in itemList {
            let value = item.value
            let sliceAngle = value! * CGFloat(360.0/100.0)
        }
    }
}
