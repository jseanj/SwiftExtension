//
//  Array.swift
//  SwiftExtension
//
//  Created by jins on 14-8-26.
//  Copyright (c) 2014年 BlackWater. All rights reserved.
//

import Foundation

public extension Array {
    // Checks if the given closure returns true value for all items in the array
    func every(test: (Element)->Bool) -> Bool {
        for item in self {
            if !test(item) {
                return false
            }
        }
        return true
    }

    // Iterates over elements of an array and returning the first element that the closure returns true for.
    func find(test: (Element)->Bool) -> Element? {
        for item in self {
            if test(item) {
                return item
            }
        }
        return nil
    }

    // This method is like find except that it returns the index of the first element that passes the closure check.
    func findIndex(test: (Element)->Bool) -> Int? {
        for (index, item: Element) in enumerate(self) {
            if test(item) {
                return index
            }
        }
        return nil
    }

    // This method is like findIndex except that it iterates over elements of the array from right to left
    func findLastIndex(test: (Element)->Bool) -> Int? {
        var lastIndex:Int?
        for (index, item: Element) in enumerate(self) {
            if test(item) {
                lastIndex = index
            }
        }
        return lastIndex
    }
    
    // Checks if a given value is present in the array
    // http://stackoverflow.com/questions/24091046/unable-to-use-contains-within-a-swift-array-extension
    func contains<T: Equatable>(value: T) -> Bool {
        return self.filter({$0 as? T == value}).count > 0
    }


    // Creates an array excluding all values of the provided arrays
    func difference<T: Equatable>(array: [Element]) -> [Element] {
        return self.filter {
            return self.contains($0 as T) && !array.contains($0 as T)
        }
    }

    /*
        intersection
        Creates an array of unique values present in all provided arrays

        [1, 2, 3].intersection([5, 2, 1, 4])
        => [1, 2]
    */
    func intersection<T: Equatable>(array: [Element]) -> [Element] {
        return self.filter { array.contains($0 as T) }
    }

    
    // Flattens a nested array of two depth
    func flatten() -> [Element] {
        var result = [Element]()
        for item in self {
            if let array = item as? Array {
                for item in array {
                    result.append(item)
                }
            } else {
                result.append(item)
            }
        }
        return result
    }
    
    /*
        ["a", "a", "b", "c", "a", "b"].frequencies()
        => ["a": 3, "b": 2, "c": 1]
    */
    func frequencies<T: Hashable>() -> [T: Int] {
        var resultDic = [T: Int]()
        for item in self {
            if let key = item as? T {
                if let freq = resultDic[key] {
                    resultDic[key] = freq + 1
                } else {
                    resultDic[key] = 1
                }
            }
        }
        return resultDic
    }

    /*
        initial
        Gets all but the last element or last n elements of an array

        [3, 4, 5].initial()
        => [3, 4]
        [3, 4, 5].initial(numElements: 2)
        => [3]
    */
    func initial(numElements: Int = 1) -> [Element]{
        var result = [Element]()
        for i in 0..<self.count-numElements {
            result.append(self[i])
        }
        return result
    }

}