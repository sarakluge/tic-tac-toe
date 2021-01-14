//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sara Kluge on 2020-12-18.
//

import UIKit

class ViewController: UIViewController {
    
    var currentPlayer = 1
    var counter = 0
    var p1Points = 0
    var p2Points = 0
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    var winningArray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func imageViewTapped(_ sender: UITapGestureRecognizer) {
        let imageView = sender.view as! UIImageView
        
        if(imageView.image == nil){
            if(currentPlayer == 1){
                imageView.image = UIImage(named:"donut1.png")
                gameState[imageView.tag - 1] = currentPlayer
                counter += 1
                checkForWinningCombo()
                currentPlayer = 2
            } else {
                imageView.image = UIImage(named:"donut2.png")
                gameState[imageView.tag - 1] = currentPlayer
                counter += 1
                checkForWinningCombo()
                currentPlayer = 1
            }
        }
    }
    
    func checkForWinningCombo() {
        for combinations in winningArray {
            if gameState[combinations[0]] != 0 &&
                gameState[combinations[0]] == gameState[combinations[1]] &&
                gameState[combinations[1]] == gameState[combinations[2]] {
                
                if gameState[combinations[0]] == 1 {
                    p1Points += 1
                    winningAlertDialog(name: "Brown")
                } else {
                    p2Points += 1
                    winningAlertDialog(name: "Pink")
                }
            }
        }
        if counter == 9 {
            winningAlertDialog(name: "nobody")
        }
    }
    
    func winningAlertDialog(name: String) {
        let alert = UIAlertController(title: "\(name) wins!", message: "Do you want to play again?", preferredStyle: .alert)
        
        let noAction = UIAlertAction(title: "No", style: .cancel)
        let yesAction = UIAlertAction(title: "Yes", style: .default) { action in
            self.playAgain()
        }
        
        alert.addAction(noAction)
        alert.addAction(yesAction)
        
        present(alert, animated: true)
    }
    
    
    
    func playAgain() {
        currentPlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        counter = 0
        
        for i in 1...9 {
            if let imageView = view.viewWithTag(i) as? UIImageView{
                imageView.image = nil
            }
        }
    }
    
    
}

