//
//  CircleViewController.swift
//  Quartz2DDraw
//
//  Created by Oniityann on 2018/9/8.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class CircleViewController: UIViewController {
    
    var circleView: CircleChart!
    var slider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()

        slider = UISlider(frame: CGRect(x: 40, y: 80, width: 280, height: 40))
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = 75
        slider.addTarget(self, action: #selector(updateCurrentValue(_:)), for: .valueChanged)
        view.addSubview(slider)
        
        circleView = CircleChart(frame: CGRect(x: 40, y: 150, width: 200, height: 200), current: CGFloat(slider.value), clockwise: true)
        circleView.strokeColor = UIColor.purple
        view.addSubview(circleView)
    }
    
    @objc func updateCurrentValue(_ slider: UISlider) {
        circleView.current = CGFloat(slider.value)
        circleView.setNeedsDisplay()
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
