class Solution {
    func leastInterval(_ tasks: [Character], _ n: Int) -> Int {
        var counts = [Int](repeating: 0, count: 26)
        for task in tasks {
            counts[Int(task.asciiValue! - Character("A").asciiValue!)] += 1
        }
        
        counts.sort { $0 < $1 }
        
        var total = 0
        while counts[25] > 0 {
            for i in 0...n {
                total += 1
                if i > 25 {
                    continue
                }
                var index = 25 - i
                if counts[index] > 0 {
                    counts[index] -= 1
                }
                
                if counts[25] == 0 {
                    break
                }
            }
            counts.sort { $0 < $1 }
        }
        
        return total
    }
}
