@testable import BullsEye

class GameViewMock: GameViewController {
  var calledUpdateScoreLabel = false
  var calledUpdateScoreLabelWithValue: Int?
  
  var calledUpdateRoundLabel = false
  var calledUpdateRoundLabelWithValue: Int?
  
  var calledUpdateTargetLabel = false
  var calledUpdateTargetLabelWithValue: Int?
  
  override func updateScoreLabel(value: Int) {
    calledUpdateScoreLabel = true
    calledUpdateScoreLabelWithValue = value
  }
  
  override func updateRoundLabel(value: Int) {
    calledUpdateRoundLabel = true
    calledUpdateRoundLabelWithValue = value
  }
  
  override func updateTargetLabel(value: Int) {
    calledUpdateTargetLabel = true
    calledUpdateTargetLabelWithValue = value
  }
  
  override func viewDidLoad() {}
}
