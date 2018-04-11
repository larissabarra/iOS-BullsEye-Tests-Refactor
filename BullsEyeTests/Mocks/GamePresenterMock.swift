@testable import BullsEye

class GamePresenterMock: GamePresenter {
  var calledHit = false
  var hitValue = -1
  
  override func hit(value: Int) {
    calledHit = true
    hitValue = value
  }
}
