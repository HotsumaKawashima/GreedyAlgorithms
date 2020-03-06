class Solution {
    
    func twoCitySchedCost(_ costs: [[Int]]) -> Int {
        var array = costs
        array.sort { abs($0[0] - $0[1]) > abs($1[0] - $1[1]) }
        
        print(array)
        
        var a = 0
        var b = 0
        var cost = 0
        for c in array {
            if (c[0] <= c[1] && a < costs.count/2) || b == costs.count/2 {
                print(c[0])
                a += 1
                cost += c[0]
            } else {
                b += 1
                cost += c[1]
            }
        }
        
        return cost
    }
}


