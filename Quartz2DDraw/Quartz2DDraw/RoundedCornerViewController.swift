//
//  RoundedCornerViewController.swift
//  Quartz2DDraw
//
//  Created by Oniityann on 2018/9/8.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class RoundedCornerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.gray

        let totalW = view.bounds.width
        let width: CGFloat = 200.0
        let startX = (totalW - width) / CGFloat(2)
        
        let imageView = UIImageView(frame: CGRect(x: startX, y: 100, width: width, height: 300))
        
        let image = UIImage(named: "Panda")
        let roundedImage = image?.image(cornerRadius: 20, size: imageView.bounds.size, cornerStyle: .topRight)
        
        imageView.image = roundedImage!
        
        view.addSubview(imageView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
