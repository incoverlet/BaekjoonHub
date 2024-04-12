import Foundation

func solution(_ number:Int, _ limit:Int, _ power:Int) -> Int {
    var divisor = Array(repeating: 0, count: number + 1)
    var answer = 0
    
    for i in 1...number {
        for j in stride(from: i, through: number, by: i) {
            divisor[j] += 1
        }
    }
    
    for count in divisor.dropFirst() {
        count > limit ? (answer += power) : (answer += count)
    }
    
    return answer
}