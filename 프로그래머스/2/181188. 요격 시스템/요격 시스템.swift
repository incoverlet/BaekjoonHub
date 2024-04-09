import Foundation

//겹치지 않는 최소의 갯수 구하는 문제
func solution(_ targets:[[Int]]) -> Int {
    //정렬을 통해서 앞에서 부터 정렬해놓는다.
    //sort를 클로저를 사용해서 
    var answer = 0
    let sortedTargets = targets.sorted { $0[1] < $1[1] || ($0[1] == $1[1] && $0[0] < $1[0]) }

    var e = 0
    for target in sortedTargets {
        if target[0] >= e {
            answer += 1
            e = target[1]
        }
    }
    return answer
}
