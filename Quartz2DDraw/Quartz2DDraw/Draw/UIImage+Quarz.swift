//
//  UIImage+Quarz.swift
//  Quartz2DDraw
//
//  Created by Oniityann on 2018/9/9.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

enum RoundedCornerStyle {
    case topLeft
    case topRight
    case botLeft
    case botRight
    case right
    case left
    case leftTopRight
    case leftBotRight
    case rightTopLeft
    case rightBotLeft
    case top
    case bot
    case all
}

extension UIImage {
    
    func image(from view: UIView) -> UIImage {
        
        /// 创建一个基于位图的有指定选项的图形上下文
        ///
        /// - Parameter size: 新位图上下文的尺寸, 代表了该方法返回图片的尺寸
        /// - Parameter opaque: 是否不透明
        /// - Parameter scale: 位图的缩放因子, 如果设置为0, 则缩放因子为设备主屏幕的缩放因子
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, view.isOpaque, 0)
        /// 渲染一个完整的视图的截图 (该视图的层级屏幕可见才会被渲染) 到当前图形上下文中
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: false)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
    func image(cornerRadius: CGFloat, size: CGSize, cornerStyle: RoundedCornerStyle) -> UIImage {
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        let context = UIGraphicsGetCurrentContext()
        
        // 切圆角
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        
        /// cornerRadii: 每个圆角半径
        
        let cornerOvalRadius = CGSize(width: cornerRadius, height: cornerRadius)
        
        let pathTopLeft = UIBezierPath(roundedRect: rect, byRoundingCorners: .topLeft, cornerRadii: cornerOvalRadius)
        let pathTopRight = UIBezierPath(roundedRect: rect, byRoundingCorners: .topRight, cornerRadii: cornerOvalRadius)
        let pathBotLeft = UIBezierPath(roundedRect: rect, byRoundingCorners: .bottomLeft, cornerRadii: cornerOvalRadius)
        let pathBotRight = UIBezierPath(roundedRect: rect, byRoundingCorners: .bottomRight, cornerRadii: cornerOvalRadius)
        let pathAll = UIBezierPath(roundedRect: rect, byRoundingCorners: .allCorners, cornerRadii: cornerOvalRadius)
        
        switch cornerStyle {
        case .topLeft:
            context?.addPath(pathTopLeft.cgPath)
        case .topRight:
            context?.addPath(pathTopRight.cgPath)
        case .botLeft:
            context?.addPath(pathBotLeft.cgPath)
        case .botRight:
            context?.addPath(pathBotRight.cgPath)
        case .left:
            context?.addPath(pathTopLeft.cgPath)
            context?.addPath(pathBotLeft.cgPath)
        case .right:
            context?.addPath(pathTopRight.cgPath)
            context?.addPath(pathBotRight.cgPath)
        case .leftTopRight:
            context?.addPath(pathTopLeft.cgPath)
            context?.addPath(pathBotLeft.cgPath)
            context?.addPath(pathTopRight.cgPath)
        case .leftBotRight:
            context?.addPath(pathTopLeft.cgPath)
            context?.addPath(pathBotLeft.cgPath)
            context?.addPath(pathBotRight.cgPath)
        case .rightTopLeft:
            context?.addPath(pathTopRight.cgPath)
            context?.addPath(pathBotRight.cgPath)
            context?.addPath(pathTopLeft.cgPath)
        case .rightBotLeft:
            context?.addPath(pathTopRight.cgPath)
            context?.addPath(pathBotRight.cgPath)
            context?.addPath(pathBotLeft.cgPath)
        case .top:
            context?.addPath(pathTopRight.cgPath)
            context?.addPath(pathTopLeft.cgPath)
        case .bot:
            context?.addPath(pathBotLeft.cgPath)
            context?.addPath(pathBotRight.cgPath)
        case .all:
            context?.addPath(pathAll.cgPath)
        }
        
        context?.clip()
        pathTopLeft.close()
        pathTopRight.close()
        pathBotLeft.close()
        pathBotRight.close()
        pathAll.close()
        
        // 绘制图片
        self.draw(in: rect)
        
        let image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()

        return image!
    }
}
