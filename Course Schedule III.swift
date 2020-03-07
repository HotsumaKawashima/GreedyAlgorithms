class Solution {
    func scheduleCourse(_ courses: [[Int]]) -> Int {
        var cs = courses
        cs.sort { $0[1] < $1[1] }
        
        var taken = [[Int]]()
        var total = 0
        for c in cs {
            total += c[0]
            pushMaxHeap(&taken, c)
            if total > c[1] {
                var long = popMaxHeap(&taken)
                total -= long[0]
            }
        }
        
        return taken.count
    }
}

func pushMaxHeap(_ array: inout [[Int]], _ v: [Int]) {
    var n = array.count
    array.append(v)

    while n != 0 {
        let i = (n - 1) / 2
        if array[i][0] < array[n][0] {
            (array[i], array[n]) = (array[n], array[i])
        }
        n = i
    }
}

func popMaxHeap(_ array: inout [[Int]]) -> [Int] {
    let n = array.count - 1
    let value = array[0]
    array[0] = array[n]
    array.removeLast()
    maxHeapify(&array)
    return value
}

func maxHeapify(_ array: inout [[Int]], _ i: Int = 0) {
    let l = 2 * i + 1
    let r = 2 * i + 2
    let n = array.count - 1
    var value = i

    if l <= n && array[i][0] < array[l][0] {
        value = l
    }
    if r <= n && array[value][0] < array[r][0] {
        value = r
    }
    if value != i {
        (array[i], array[value]) = (array[value], array[i])
        maxHeapify(&array, value)
    }
}

