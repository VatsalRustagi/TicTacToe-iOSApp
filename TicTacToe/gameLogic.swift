//
//  gameLogic.swift
//  TicTacToe
//
//  Created by Vatsal Rustagi on 4/25/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import Foundation

class gameLogic{
    let DOT = "."
    let X = "X"
    let O = "O"
    var grid: Array<Array<String>> = []
    
    init() {
        self.grid = [[DOT,DOT,DOT],[DOT,DOT,DOT],[DOT,DOT,DOT]]
    }
    
    func setXAt(X j: Int, Y i:Int)
    {
        self.grid[i][j] = "X"
    }
    
    func setOAt(X j: Int, Y i:Int)
    {
        self.grid[i][j] = "O"
    }
    
    func ifGridFull() -> Bool{
        for l in self.grid{
            if l.contains(DOT){
                return false
            }
        }
        return true
        
    }
    
    func printGrid(){
        for i in 0...2{
            for j in 0...2{
                print(self.grid[i][j] + " ", terminator: "")
            }
            print()
        }
        print()
    }
    
    func reset(){
        self.grid = [[DOT,DOT,DOT],[DOT,DOT,DOT],[DOT,DOT,DOT]]
    }
    
    func checkWinner() -> (Bool, String){
        if grid[0][0] != DOT{
            let s = grid[0][0]
            if s == grid[0][1] && s == grid[0][2]{
                return (true, s)
            }
            if s == grid[1][1] && s == grid[2][2]{
                return (true, s)
            }
            if s == grid[1][0] && s == grid[2][0]{
                return (true, s)
            }
        }
        if grid[0][1] != DOT{
            let s = grid[0][1]
            if s == grid[1][1] && s == grid[2][1]{
                return (true, s)
            }
        }
        if grid[0][2] != DOT{
            let s = grid[0][2]
            if s == grid[1][2] && s == grid[2][2]{
                return (true, s)
            }
            if s == grid[1][1] && s == grid[2][0]{
                return (true, s)
            }
        }
        if grid[1][0] != DOT{
            let s = grid[1][0]
            if s == grid[1][1] && s == grid[1][2]{
                return (true, s)
            }
        }
        if grid[2][0] != DOT{
            let s = grid[2][0]
            if s == grid[2][1] && s == grid[2][2]{
                return (true, s)
            }
        }
        return (false, "")
    }
    
    
}
