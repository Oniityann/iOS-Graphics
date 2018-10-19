//
//  BasicFilterApplyingViewController.swift
//  ProcessingImages
//
//  Created by Oniityann on 2018/9/9.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit
import CoreImage

class BasicFilterApplyingViewController: BaseViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 1. 单利创建一次 CIContext
        
        /// 2. 初始化一个 CIFilter, 并设置相关数据
        let filter = CIFilter(name: "CISepiaTone")!
        filter.setValue(0.8, forKey: kCIInputIntensityKey)
        /// 3. 创建一个 CIImage 对象
        let image = CIImage(image: UIImage(named: "aaa")!)
        filter.setValue(image, forKey: kCIInputImageKey)
        /// 4. 获取滤镜输出
        let result = filter.outputImage!
        /// 5. 将滤镜输出的 CIImage 渲染为一个 CGImage 对象
        let cgImage = FilterManager.shared.context.createCGImage(result, from: result.extent)!
        let finalImage = UIImage(cgImage: cgImage)
        imageView.image = finalImage
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
