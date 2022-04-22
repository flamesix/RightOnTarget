//
//  Game.swift
//  RightOnTarget
//
//  Created by Юрий Гриневич on 21.04.2022.
//

import Foundation

protocol GameProtocol {
    var score: Int { get }
    var currentSecretNumber: Int { get }
    var isGameEnded: Bool { get }
    
    func restartGame()
    func startNewGame()
    func calculateScore(with: Int)
}

final class Game: GameProtocol {
    
    private var startValue: Int
    private var endValue: Int
    private var lastRound: Int
    private var currentRound = 1
    
    var score: Int = 0
    var currentSecretNumber: Int = 0
    var isGameEnded: Bool {
        currentRound >= lastRound ? true : false
    }
    
    init?(startValue: Int, endValue: Int, rounds: Int) {
        
        guard startValue <= endValue else {return nil}
        
        self.startValue = startValue
        self.endValue = endValue
        lastRound = rounds
        currentSecretNumber = self.getNewSecretNumber()
    }
    
    private func getNewSecretNumber() -> Int {
        (startValue...endValue).randomElement()!
    }
    
    func restartGame() {
        currentRound = 0
        score = 0
        startNewGame()
    }
    
    func startNewGame() {
        currentSecretNumber = self.getNewSecretNumber()
        currentRound += 1
    }
    
    func calculateScore(with number: Int) {
        if number == currentSecretNumber {
            score += 50
        } else if number < currentSecretNumber {
            score += 50 - currentSecretNumber + number
        } else if number > currentSecretNumber {
            score += 50 - number + currentSecretNumber
        }
    }
    
    
}
