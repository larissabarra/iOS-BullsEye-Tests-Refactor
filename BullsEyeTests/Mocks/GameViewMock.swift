@testable import BullsEye

class GameViewMock: GameViewController {
  var didCallUpdateScoreLabel = false
  var didCallUpdateScoreLabelWithValue: Int?
  
  override func updateScoreLabel(value: Int) {
    didCallUpdateScoreLabel = true
    didCallUpdateScoreLabelWithValue = value
  }
}
