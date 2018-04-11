@testable import BullsEye

class GameMock: Game {
  var round: Int = 1
  var target: Int = -1
  var score: Int = 0
  
  var didCallHit = false
  var didCallHitWithValue: Int?
  
  func newRound() {
  }
  
  func reset() {
  }
  
  func hit(guess: Int) -> PerfectionLevel {
    didCallHit = true
    didCallHitWithValue = guess
    return .almost
  }
}
