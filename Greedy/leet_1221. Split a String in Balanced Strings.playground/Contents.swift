

//func balancedStringSplit(_ s: String) -> Int {
//
//    var lStack = 0
//    var rStack = 0
//    var balanced = 0
//
//    for c in s {
//        if c == "L" {
//            lStack += 1
//        } else {
//            rStack += 1
//        }
//
//        if lStack == rStack {
//            balanced += 1
//            lStack = 0
//            rStack = 0
//        }
//    }
//
//    return balanced
//}

func balancedStringSplit(_ s: String) -> Int {
    
    var stack = 0
    var balanced = 0
    
    for c in s {
        if c == "L" {
            stack += 1
        } else {
            stack -= 1
        }
        
        if stack == 0 {
            balanced += 1
        }
    }
    
    return balanced
}

balancedStringSplit("RLLLLRRRLR")
