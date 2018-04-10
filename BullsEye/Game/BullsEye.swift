import Foundation

protocol Game {
  var round: Int { get }
  var target: Int { get }
  var score: Int { get }
  
  func newRound()
  func reset()
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
  }
  
  private func generateRandomNumber() -> Int {
    var random = target
    while random == target {
      random = 1 + Int(arc4random_uniform(100))
    }
    return random
  }
}
