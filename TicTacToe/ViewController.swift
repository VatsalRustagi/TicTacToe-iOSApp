//
//  ViewController.swift
//  TicTacToe
//
//  Created by Vatsal Rustagi on 4/25/17.
//  Copyright © 2017 Vatsal Rustagi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIGestureRecognizerDelegate{

    @IBOutlet var buttons: [UIButton]!

    var turn: String = "X"
    var game: gameLogic = gameLogic()
    var gameEnded: Bool = false
    @IBOutlet weak var turnLabel: UILabel!
    @IBOutlet weak var playAgainButton: UIButton!
    @IBAction func playAgainButton(_ sender: UIButton) {
        for b in buttons{
            b.setTitle(nil, for: .normal)
        }
        game.reset()
        turnLabel.text = "Turn: " + "X"
        turn = "X"
        playAgainButton.isHidden = true
        gameEnded = false
    }
    
    let bgcolor = UIColor(red:0.40, green:0.25, blue:0.45, alpha:1.0)
    
    @IBAction func gameButton(_ sender: UIButton) {
        if sender.currentTitle == nil && !gameEnded{
            sender.setTitle(turn, for: .normal)
            sender.setTitleColor(bgcolor, for: .normal)
            let x = Int(sender.frame.midX/110)
            let y = Int(sender.frame.midY/100) - 2
            if turn == "X"{
                turn = "O"
                game.setXAt(X: x,Y: y)
            }
            else{
                turn = "X"
                game.setOAt(X: x,Y: y)
            }
            turnLabel.text = "Turn: " + turn
        }
        let winner = game.checkWinner()
        if winner.0{
            gameEnded = true
            turnLabel.text = "Winner: \(winner.1)"
            playAgainButton.isHidden = false
        }
        else if game.ifGridFull(){
            gameEnded = true
            turnLabel.text = "Draw!"
            playAgainButton.isHidden = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

