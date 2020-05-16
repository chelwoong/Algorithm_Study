

func mergeSort(_ array: [Int]) -> [Int] {
    guard array.count > 1 else { return array }
    
    let mid = array.count/2
    let leftArray = mergeSort(Array(array[0..<mid]))
    let rightArray = mergeSort(Array(array[mid..<array.count]))
    
    return merge(leftPile: leftArray, rightPile: rightArray)
}

func merge(leftPile: [Int], rightPile: [Int]) -> [Int] {
    var leftIndex = 0
    var rightIndex = 0
    
    var orderedPile = [Int]()

    while leftIndex < leftPile.count, rightIndex < rightPile.count {
        if leftPile[leftIndex] <= rightPile[rightIndex] {
            orderedPile.append(leftPile[leftIndex])
            leftIndex += 1
        } else {
            orderedPile.append(rightPile[rightIndex])
            rightIndex += 1
        }
    }
    
    while leftIndex < leftPile.count {
        orderedPile.append(leftPile[leftIndex])
        leftIndex += 1
    }
    
    while rightIndex < rightPile.count {
        orderedPile.append(rightPile[rightIndex])
        rightIndex += 1
    }

    return orderedPile
}

func mergeBottomUp(_ array: [Int]) -> [Int] {
    
    var size = 1
    var orderedArray = array
    
    while size  < array.count {
        var i = 0
        while i < array.count {
            var pileIndex = 0
            
            let max = min(i + size * 2, array.count)
            let mid = min(i + size, max)

            let leftPile = Array(orderedArray[i..<mid])
            let rightPile = Array(orderedArray[mid..<max])
            let orderedPile =  merge(leftPile: leftPile, rightPile: rightPile)

            
            while pileIndex < orderedPile.count {
                orderedArray[pileIndex+i] = orderedPile[pileIndex]
                pileIndex += 1
            }
            
            i = max
        }
        
        size *= 2
    }
    
    return orderedArray
}

//mergeSort([5, 6, 2, 1, 5, 10, 4])
mergeBottomUp([5, 6, 2, 1, 5, 10, 4])
