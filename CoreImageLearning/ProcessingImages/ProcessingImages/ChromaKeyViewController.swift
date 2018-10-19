//
//  ChromaKeyViewController.swift
//  ProcessingImages
//
//  Created by CallbackHell on 2018/9/10.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit

class ChromaKeyViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let foregroundCIImage = CIImage(image: UIImage(named: "chromaSlice")!)!
        let backgroundCIImage = CIImage(image: UIImage(named: "chromaBg")!)!
        let chromaFilter = chromaKeyFilter(fromHue: 0.3, toHue: 0.4)
        chromaFilter.setValue(foregroundCIImage, forKey: kCIInputImageKey)
        let sourceCIImageWithoutBg = chromaFilter.outputImage
        
        let compositer = CIFilter(name: "CISourceOverCompositing")
        compositer?.setValue(sourceCIImageWithoutBg, forKey: kCIInputImageKey)
        compositer?.setValue(backgroundCIImage, forKey: kCIInputBackgroundImageKey)
        let compositedCIImage = compositer?.outputImage
        
        let image = UIImage(ciImage: compositedCIImage!)
        imageView.image = image
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func chromaKeyFilter(fromHue: CGFloat, toHue: CGFloat) -> CIFilter {
        // 1. 分配内存
        let size = 64
        var cubeRGB = [Float]()
        
        // 2. 遍历每个红绿蓝组合
        for z in 0 ..< size {
            let blue = CGFloat(z) / CGFloat(size - 1)
            for y in 0 ..< size {
                let green = CGFloat(y) / CGFloat(size - 1)
                for x in 0 ..< size {
                    let red = CGFloat(x) / CGFloat(size - 1)
                    
                    // 3. 转换 RGB 至 HSV
                    let hue = getHue(red: red, green: green, blue: blue)
                    let alpha: CGFloat = (hue >= fromHue && hue <= toHue) ? 0 : 1
                    
                    cubeRGB.append(Float(red * alpha))
                    cubeRGB.append(Float(green * alpha))
                    cubeRGB.append(Float(blue * alpha))
                    cubeRGB.append(Float(alpha))
                }
            }
        }
        
        let data = Data(buffer: UnsafeBufferPointer(start: &cubeRGB, count: cubeRGB.count))
        
        let colorCubeFilter = CIFilter(name: "CIColorCube", withInputParameters: ["inputCubeDimension": size, "inputCubeData": data])
        return colorCubeFilter!
    }
    
    func getHue(red: CGFloat, green: CGFloat, blue: CGFloat) -> CGFloat {
        let color = UIColor(red: red, green: green, blue: blue, alpha: 1)
        var hue: CGFloat = 0
        color.getHue(&hue, saturation: nil, brightness: nil, alpha: nil)
        return hue
    }

}
