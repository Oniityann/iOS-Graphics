//
//  PieItem.swift
//  Quartz2DDraw
//
//  Created by Oniityann on 2018/9/9.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class PieItem: NSObject {
    /// 饼图显示名字
    var name: String?
    /// 饼图颜色
    var color: UIColor?
    /// 每一份所占比例
    var value: CGFloat?
    /// 起始值
    var startPercent: CGFloat?
    /// 结束值
    var endPercent: CGFloat?
}
