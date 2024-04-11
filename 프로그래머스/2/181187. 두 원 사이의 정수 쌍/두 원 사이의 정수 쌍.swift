import Foundation

func solution(_ r1:Int, _ r2:Int) -> Int64 {
    // 원안의 정점의 곗수구하는 문제
    // 약간 백준 스타일이네
    // r2 > r1
    // r1 2일때 r2 3일때 최대  18(r2) >= (x*x + y*y) >= 4(r1) 에 해당하는 모든 점
    // dp로 푸는 방법도 있을거같은데 
    
    var answer = 0
    // 0 부터 시작하지 않는 이유 = 4배 해야하는데 x가 0이면 겹쳐서 들어감.
    for i in 1...r2 {
        
        var m: Int // r1의 i(변하는 x축)에 따라 변화하는 길이  
        var M: Int // r2의 i(변하는 x축)에 따라 변화하는 길이
        
        if i < r1 {
            m = Int(ceil(sqrt(Double((r1*r1)-(i*i)))))
        } else {
            m = 0
        }

        M = Int(sqrt(Double((r2*r2)-(i*i))))
        
        answer += (M - m + 1)
    }

    return Int64(answer * 4)
}