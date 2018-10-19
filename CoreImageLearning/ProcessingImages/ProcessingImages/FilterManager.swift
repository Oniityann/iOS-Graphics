//
//  FilterManager.swift
//  ProcessingImages
//
//  Created by Oniityann on 2018/9/9.
//  Copyright © 2018年 Oniityann. All rights reserved.
//

import UIKit
import CoreImage

public class FilterManager {
    let context: CIContext
    static let shared = FilterManager()
    private init() {
        context = CIContext()
    }
}
