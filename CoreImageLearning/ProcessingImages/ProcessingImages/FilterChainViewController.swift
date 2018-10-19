//
//  FilterChainViewController.swift
//  ProcessingImages
//
//  Created by Oniityann on 2018/9/9.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit
import CoreImage
import simd

class FilterChainViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    var displayLink: CADisplayLink!
    
    var time = 0.0
    var dt = 0.0
    
    let sourceCIImage = CIImage(image: UIImage(named: "aaa")!)!
    let destinationCIImage = CIImage(image: UIImage(named: "bbb")!)!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ciImage = CIImage(image: UIImage(named: "aaa")!)!
        let processedCiImage = applyFilterChain(to: ciImage)
        let image = UIImage(ciImage: processedCiImage, scale: 2.0, orientation: .downMirrored)
        imageView.image = image
//        beginTransition()
    }
    
    @objc func stepTime() {
        time += dt
        
        if time > 1 {
            displayLink.remove(from: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
        } else {
            guard let dissolvedCIImage = transitionFilter(sourceCIImage,
                                                        to:destinationCIImage,
                                                        time:time) else {
                                                            return
            }
            // imageView and ciContext are properties of the class.
            showCIImage(dissolvedCIImage, in:imageView, context:FilterManager.shared.context)
        }
    }
    
    func beginTransition() {
        time = 0
        dt = 0.005
        
        displayLink = CADisplayLink(target: self,
                                    selector: #selector(stepTime))
        displayLink.add(to: RunLoop.current, forMode: RunLoopMode.defaultRunLoopMode)
    }
    
    func showCIImage(_ ciImage: CIImage,
                     in imageView: UIImageView,
                     context: CIContext) {
        guard let cgImage = context.createCGImage(ciImage, from: ciImage.extent) else { return }
        let uiImage = UIImage(cgImage: cgImage)
        imageView.image = uiImage
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func transitionFilter(_ inputImage: CIImage, to targetImage: CIImage, time: TimeInterval) -> CIImage? {
        let inputTime = simd_smoothstep(0, 1, time)
        
        guard let filter = CIFilter(name: "CIDissolveTransition",
                                    withInputParameters:
            [
                kCIInputImageKey: inputImage,
                kCIInputTargetImageKey: targetImage,
                kCIInputTimeKey: inputTime
            ]) else { return nil }
        
        return filter.outputImage
    }
    
    func applyFilterChain(to image: CIImage) -> CIImage {
        // The CIPhotoEffectInstant filter takes only an input image
        let colorFilter = CIFilter(name: "CIPhotoEffectProcess", withInputParameters:
            [kCIInputImageKey: image])!
        
        // Pass the result of the color filter into the Bloom filter
        // and set its parameters for a glowy effect.
        let bloomImage = colorFilter.outputImage!.applyingFilter("CIBloom", parameters: [kCIInputRadiusKey: 10.0, kCIInputIntensityKey: 1.0])

        let cropRect = CGRect(x: 150, y: 150, width: 80, height: 80)

        let croppedImage = bloomImage.cropped(to: cropRect)
        
        return croppedImage
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
