@testable import BullsEye

class GameViewMock: GameViewController {
  var didCallUpdateScoreLabel = false
  var didCallUpdateScoreLabelWithValue: Int?
  
  var calledUpdateRoundLabel = false
  var calledUpdateRoundLabelWithValue: Int?
  
  override func updateScoreLabel(value: Int) {
    didCallUpdateScoreLabel = true
    didCallUpdateScoreLabelWithValue = value
  }
  
  override func updateRoundLabel(value: Int) {
    calledUpdateRoundLabel = true
    calledUpdateRoundLabelWithValue = value
  }
}
