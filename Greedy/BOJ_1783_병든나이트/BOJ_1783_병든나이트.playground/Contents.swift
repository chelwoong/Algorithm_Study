let board = readLine()!.split(separator: " ").map {Int($0)!}

if board[0] == 1 {
    print(1)
} else if board[0] == 2 {
    print(min((board[1]+1)/2 , 4))
} else if board[1] < 6 {
    if board[1] <= 3 {
        print(board[1])
    } else {
        print(4)
    }
} else {
    print(board[1]-2)
}
