//
//  ViewController.swift
//  RightOnTarget
//
//  Created by Юрий Гриневич on 20.04.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var slider: UISlider!
    @IBOutlet var label: UILabel!
    
    var game: Game!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        game = Game(startValue: 1, endValue: 50, rounds: 5)
        updateLabelWithNewSecretNumber(text: String(game.currentSecretNumber))
        
    }
    
    
    @IBAction func checkNumber() {
        game.calculateScore(with: Int(slider.value))
        if game.isGameEnded {
            showAlertWith(score: game.score)
            game.restartGame()
        } else {
            game.startNewGame()
        }
        
        updateLabelWithNewSecretNumber(text: String(game.currentSecretNumber))
    }
    
    private func updateLabelWithNewSecretNumber(text: String) {
        label.text = text
    }
    
    private func showAlertWith(score: Int) {
        let alert = UIAlertController(title: "Игра окончена",
                                      message: "Вы набрали: \(score) очков",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}

