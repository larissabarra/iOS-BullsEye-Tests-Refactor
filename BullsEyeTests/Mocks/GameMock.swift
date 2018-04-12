import Foundation

@testable import BullsEye

class GameMock: Game {
  
  var round: Int = 1
  var target: Int = -1
  var score: Int = 0
  
  var didCallHit = false
  var didCallHitWithValue: Int?
  
  var calledReset = false
  
  var calledNewRound = false
  
  func newRound() {
    calledNewRound = true
    round += 1
    target = (target + 1) % 100
  }
  
  func reset() {
    calledReset = true
    round = 1
    score = 0
    target = 1
  }
  
  func hit(guess: Int) -> Score {
    didCallHit = true
    didCallHitWithValue = guess
    return Score(score: 149, perfection: .almost)
  }
}
