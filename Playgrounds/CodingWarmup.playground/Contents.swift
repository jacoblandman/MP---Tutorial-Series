//: Playground - noun: a place where people can play

import UIKit

func combineArray(_ array1: [Any], with array2: [Any]) -> [Any] {
    
    // create a new array and set it equal to the first array
    var newArray = array1
    
    // insert the values of the second array
    var index = 1
    for element in array2 {
        newArray.insert(element, at: index)
        index = index < 2 * array1.count - 1 ? index + 2 : index + 1
    }
    
    return newArray
}

let array1 = ["a", "b", "c"]
let array2 = ["bo", "ro", "me"]

let combinedArray = combineArray(array1, with: array2)

print(combinedArray)

let arr1 = ["a","b","c","d","e"]
let arr2 = ["bo","ro","me","lo","fa","se"]

print(combineArray(arr1, with: arr2))