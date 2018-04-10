import Foundation

protocol Game {
  var round: Int { get }
  var target: Int { get }
  var score: Int { get }
  
  func newRound()
  func reset()
  func hit(guess: Int) -> Int
}

class BullsEye: Game {
  var round = 1
  var target = 0
  var score = 0
  
  init() {
    target = generateRandomNumber()
  }
  
  func newRound() {
    round += 1
    target = generateRandomNumber()
  }
  
  func reset() {
    score = 0
    round = 1
    target = generateRandomNumber()
  }
  
  func hit(guess: Int) -> Int {
    let difference = abs(target - guess)
    var points = 100 - difference
    
    points += calculateBonus(forDifference: difference)
    
    score += points
    return points
  }
  
  private func calculateBonus(forDifference difference: Int) -> Int {
    var points = 0
    if difference == 0 {
      points += 100
    } else if difference < 5 {
      if difference == 1 {
        points += 50
      }
    }
    return points
  }
  
  private func generateRandomNumber() -> Int {
    var random = target
    while random == target {
      random = 1 + Int(arc4random_uniform(100))
    }
    return random
  }
}
