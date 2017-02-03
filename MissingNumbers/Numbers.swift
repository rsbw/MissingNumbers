//
//  Numbers.swift
//  MissingNumbers
//
//  Created by Sergey Sergeyev on 2/3/17.
//  Copyright © 2017 sergey. All rights reserved.
//

import Cocoa

final class Numbers {

    let sequence: [Int]
    
    init(sequence: [Int]) {
        self.sequence = sequence
    }
    
    func find2Missing() -> [Int] {
        return find(array: sequence, offset: 0, maximal: sequence.last!, missing: 2)
    }
    
    private func find(array: [Int], offset: Int, maximal: Int, missing: Int) -> [Int] {
        
        if array.count <= missing + 1 {
            var found = [Int]()
            var valid = offset + 1
            
            for value in array {
                if value != valid + found.count {
                    found.append(valid)
                }
                valid += 1
            }
            return found
        }

        let maxIndex: Int = array.count
        let maxValue: Int = maximal - offset
        
        let midIndex: Int = maxIndex / 2
        let midValue: Int = array[midIndex - 1] - offset
        
        let lostInFirst: Int = midValue - midIndex
        let lostInSecond: Int = maxValue - maxIndex - lostInFirst
        
        var part1 = [Int]()
        var part2 = [Int]()
        
        if lostInFirst > 0 {
            let subarray = Array(array[0..<midIndex])
            part1 = find(array: subarray, offset: offset, maximal: midIndex + offset + lostInFirst + 1, missing: lostInFirst)
        }
        
        if lostInSecond > 0 {
            let subarray = Array(array[midIndex..<maxIndex])
            part2 = find(array: subarray, offset: midIndex + offset + lostInFirst, maximal: maximal, missing: lostInSecond)
        }

        return part1 + part2
    }
}
