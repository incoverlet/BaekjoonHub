func solution(_ numbers: [Int]) -> [Int] {
    var result = [Int](repeating: -1, count: numbers.count)
    var stack: [Int] = []
    
    for i in stride(from: numbers.count - 1, through: 0, by: -1) {
        while !stack.isEmpty && numbers[stack.last!] <= numbers[i] {
            stack.removeLast()
        }
        if !stack.isEmpty {
            result[i] = numbers[stack.last!]
        }
        stack.append(i)
    }
    
    return result
}