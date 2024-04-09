import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    let check = initVertex(edges)
    let answer = checkGraph(check)
    return answer
}
// ( key : tuple() ) 형태 딕셔너리로 각 노드 연결에 대해 정리해주는 함수 입니다.
func initVertex(_ edges: [[Int]]) -> [Int : (input: Int,output: Int)]{
    
    //반환할 값 초기화
    var edge_vertex = [Int : (input:Int, output:Int)]()
    
    //dictionary key default 사용하는 방법입니다.
    for i in edges {
        edge_vertex[i[0], default: (0, 0)].output += 1
        edge_vertex[i[1], default: (0, 0)].input += 1
    }
    
    return edge_vertex
}
func checkGraph(_ edge: [Int: (input: Int,output: Int)]) -> [Int]{
    //반환해야할 key , 도넛모양, 막대모양 , 8자모양 그래프 값 입니다.
    var answer = [0,0,0,0]
    for (key, value) in edge{
        if value.output >= 2 && value.input == 0{
            answer[0] = key
        }else if value.output == 0 && value.input > 0{
            answer[2] += 1
        }else if value.output >= 2 && value.input >= 2{
            answer[3] += 1
        }
    }
    if let rootOutgoing = edge[answer[0]]?.output {
        answer[1] = rootOutgoing - answer[2] - answer[3]
    }
    return answer
}
/*
print(solution([[4, 11], [1, 12], [8, 3], [12, 7], [4, 2], [7, 11], [4, 8], [9, 6], [10, 11], [6, 10], [3, 5], [11, 1], [5, 3], [11, 9], [3, 8]]))
*/