//
//  main.swift
//  SwiftExtension
//
//  Created by jins on 14-8-26.
//  Copyright (c) 2014年 BlackWater. All rights reserved.
//

import Foundation

let array = [1, 2, 3, 4]
let stringArray = ["a", "b", "c", "a"]
//let result = array.every {
//    $0 > 2
//}

let result = array.contains(3)
println("\(result)")
let resultArray = array.difference([3, 4, 5])
println("\(resultArray)")


println("\([[1, 2, 3], 4].flatten())")
let dic:[String: Int] = stringArray.frequencies()
println("\(dic)")
println("\([3, 4, 5].initial())")
println("Hello, World!")

