//
//  CircleChart.swift
//  Quartz2DDraw
//
//  Created by Oniityann on 2018/9/8.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class CircleChart: UIView {
    
    var current: CGFloat!
    var clockwise = true
    var total: CGFloat = 100.0
    
    var strokeColor = UIColor.orange
    var lineWidth: CGFloat = 8.0
    
    var valueLabel: UILabel?
    
    init(frame: CGRect, current: CGFloat, clockwise: Bool = true) {
        self.current = current
        self.clockwise = clockwise
        super.init(frame: frame)
        
        addLabel()
    }

    func addLabel() {
        let centerX: CGFloat = frame.width / 2
        let centerY: CGFloat = frame.height / 2
        let center = CGPoint(x: centerX, y: centerY)
        
        valueLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 100, height: 50))
        valueLabel?.textAlignment = .center
        valueLabel?.font = UIFont.boldSystemFont(ofSize: 16.0)
        valueLabel?.textColor = UIColor.darkText
        valueLabel?.backgroundColor = UIColor.clear
        valueLabel?.center = center
        valueLabel?.text = "0%"
        self.addSubview(valueLabel!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
        
        let ctxt = UIGraphicsGetCurrentContext()
        
        ctxt?.setFillColor(UIColor.white.cgColor)
        ctxt?.fill(rect)
        
        // 起始弧度与结束弧度
        let startAngle: CGFloat = 270.0 * CGFloat(Double.pi / 180.0)
        let angleOffset: CGFloat = 360 * (current / total) * CGFloat(Double.pi / 180.0)
        let endAngle = clockwise ? startAngle + angleOffset : startAngle - angleOffset
        let lineWidth: CGFloat = 8
        
        // 添加弧线
        let centerX: CGFloat = frame.width / 2
        let centerY: CGFloat = frame.height / 2
        let center = CGPoint(x: centerX, y: centerY)
        var radius: CGFloat = centerX < centerY ? centerX : centerY
        radius -= lineWidth / 2
        
        ctxt?.addArc(center: center, radius: radius, startAngle: startAngle, endAngle: endAngle, clockwise: clockwise ? false : true)
        
        ctxt?.setLineWidth(lineWidth)
        ctxt?.setLineCap(.round)
        ctxt?.setStrokeColor(strokeColor.cgColor)
        
        ctxt?.strokePath()
        
        let percent = CGFloat(100.0) * current / total
        let intPercent = Int(percent)
        valueLabel!.text = "\(intPercent)%"
    }

}
