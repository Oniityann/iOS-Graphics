//
//  ViewController.swift
//  CGDrawing
//
//  Created by Oniityann on 2018/9/6.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let rect = CGRect(x: 0, y: 44, width: view.frame.width, height: view.frame.height - 78)
        
        let ellipse = FaceView(frame: rect)
        view.addSubview(ellipse)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

