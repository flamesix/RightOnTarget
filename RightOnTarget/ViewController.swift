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
    
    var number = 0
    var round = 0
    var points = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func checkNumber() {
        if round == 0 {
            number = Int.random(in: 1...50)
            label.text = String(number)
            round = 1
        } else {
            let numSlider = Int(slider.value.rounded())
            if number == numSlider {
                points += 50
            } else if number < numSlider {
                points += 50 - numSlider + number
            } else if number > numSlider {
                points += 50 - number + numSlider
            }
            if round == 5 {
                let alert = UIAlertController(title: "Игра окончена",
                                              message: "Вы набрали: \(points) очков",
                                              preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Начать заново", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                
                points = 0
                round = 1
            } else {
                round += 1
            }
            number = Int.random(in: 1...50)
            label.text = String(number)
        }
    }
    
}

