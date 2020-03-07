class Solution {
    func canCompleteCircuit(_ gas: [Int], _ cost: [Int]) -> Int {
        next: for fi in 0..<cost.count {
            var res = gas[fi] - cost[fi]
            
            if res < 0 { continue }
            
            var i = (fi + 1) % cost.count
            while fi != i {
                res = res + gas[i] - cost[i]
                
                if res < 0 { continue next }
                
                i = (i + 1) % cost.count
            }
            
            return fi
        }
        
        return -1
    }
}
