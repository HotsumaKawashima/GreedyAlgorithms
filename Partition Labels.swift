class Solution {
    func partitionLabels(_ S: String) -> [Int] {
        var array = [Int]()
        for c in S {
            array.append(Int(c.asciiValue! - Character("a").asciiValue!))
        }
        
        var ps = part(array)
        var counts = [Int]()
        
        for p in ps {
            var count = 0
            for c in p {
                count += c
            }
            counts.append(count)
        }
        
        return counts
    }
}

func merge(_ a: [Int], _ b: [Int]) -> [Int] {
    var m = [Int](repeating: 0, count: 26)
    for c in 0..<a.count {
        m[c] = a[c] + b[c]
    }
    return m
}

func part(_ cs: [Int]) -> [[Int]] {
    var target = cs
    var array = [[Int]]()

    next: for c in target {
        var m = [Int](repeating: 0, count: 26)
        m[c] += 1
        
        for i in (0..<array.count).reversed() {
            if array[i][c] > 0 {
                for j in i..<array.count {
                    m = merge(m, array[array.count - 1])
                    array.removeLast()
                }

                array.append(m)
                continue next
            }
        }
        array.append(m)
    }

    return array
}
