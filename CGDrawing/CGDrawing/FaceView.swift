//
//  EllipseView.swift
//  CGDrawing
//
//  Created by Oniityann on 2018/9/6.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class FaceView: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        
        // 设置 View 背景色, 默认为黑色
        context?.setFillColor(UIColor.white.cgColor)
        context?.fill(rect)
        
        context?.translateBy(x: 0, y: bounds.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        
        makeEllipse(context, rect)
        drawLeftEye(context)
        drawRightEye(context)
        drawTriangle(context)
        drawRectangle(context)
    }
    
    func makeEllipse(_ context: CGContext?, _ rect: CGRect) {
        // 获取图形上下文
        let rectangle = CGRect(x: 20, y: 30, width: 280, height: 260)
        
        // 添加椭圆
        context?.addEllipse(in: rectangle)
        
        // 设置填充颜色
        context?.setFillColor(UIColor.orange.cgColor)
        
        // 填充路径
        context?.fillPath()
    }
    
    
    func drawCircle(_ context: CGContext?, at point: CGPoint) {
        let context = UIGraphicsGetCurrentContext()
        
        let radius: CGFloat = 20.0
        
        // 绘制圆
        context?.addArc(center: point, radius: radius, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: true)
        
        // 设置线条宽度颜色
        context?.setStrokeColor(UIColor.blue.cgColor)
        context?.setLineWidth(3.0)
        
        // 绘制空心圆
        context?.strokePath()
        
        // 绘制小圆形
        context?.addArc(center: point, radius: radius/2, startAngle: 0, endAngle: CGFloat(Double.pi * 2), clockwise: false)
        
        context?.setFillColor(UIColor.blue.cgColor)
        
        context?.fillPath()
    }
    
    func drawLeftEye(_ context: CGContext?) {
        drawCircle(context, at: CGPoint(x: 120, y: 100))
    }
    
    func drawRightEye(_ context: CGContext?) {
        drawCircle(context, at: CGPoint(x: 200, y: 100))
    }

    func drawTriangle(_ context: CGContext?) {
        
        // 创建一个新的路径
        context?.beginPath()
        
        // 添加起始点
        context?.move(to: CGPoint(x: 160, y: 140))
        
        // 添加线条
        context?.addLine(to: CGPoint(x: 190, y: 190))
        context?.addLine(to: CGPoint(x: 130, y: 190))
        
        // 关闭并终止当前路径的子路径
        context?.closePath()
        
        context?.setFillColor(UIColor.brown.cgColor)
        
        context?.fillPath()
    }
    
    func drawRectangle(_ context: CGContext?) {
        
        let rectangle = CGRect(x: 100, y: 225, width: 120, height: 15)
        
        // 添加矩形路径
        context?.addRect(rectangle)
        
        context?.setFillColor(UIColor.red.cgColor)
        
        context?.fillPath()
    }
}
