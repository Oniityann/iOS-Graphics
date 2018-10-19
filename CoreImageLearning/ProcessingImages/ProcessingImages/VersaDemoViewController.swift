//
//  VersaDemoViewController.swift
//  ProcessingImages
//
//  Created by CallbackHell on 2018/9/10.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class VersaDemoViewController: UIViewController {
    
    let maskRect = CGRect(x: 140, y: 86, width: 143.33, height: 240)

    @IBOutlet weak var imageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let maskCIImage = CIImage(image: UIImage(named: "guide_mask")!)!

        let chromaFilter = chromaKeyFilter(maskCIImage)
        chromaFilter.setValue(maskCIImage, forKey: kCIInputImageKey)
        let filteredCIImage = chromaFilter.outputImage!
        let filteredUIImage = UIImage(ciImage: filteredCIImage)
        
//        let maskView = UIImageView()
//        maskView.image = filteredUIImage
//        maskView.frame = maskRect
//        imageView.layer.mask = maskView.layer
        
        imageView.image = filteredUIImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func chromaKeyFilter(_ ciImage: CIImage) -> CIFilter {
        
        let colorCubeFilter = CIFilter(name: "CIMaskToAlpha", withInputParameters: [kCIInputImageKey: ciImage])
        return colorCubeFilter!
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
