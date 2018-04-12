class GamePresenter {
  weak var view: GameViewController?
  let game: Game
  
  init(view: GameViewController, game: Game = BullsEye()) {
    self.view = view
    self.game = game
    
    self.view?.presenter = self
    
    reset()
  }
  
  func reset() {
    game.reset()
    updateRoundLabel()
    updateScoreLabel()
    updateTargetLabel()
  }
  
  func newRound() {
    game.newRound()
    updateRoundLabel()
    updateTargetLabel()
  }
  
  func hit(value: Int) {
    _ = game.hit(guess: value)
    updateScoreLabel()
  }
  
  private func updateScoreLabel() {
    view?.updateScoreLabel(value: game.score)
  }
  
  private func updateRoundLabel() {
    view?.updateRoundLabel(value: game.round)
  }
  
  private func updateTargetLabel() {
    view?.updateTargetLabel(value: game.target)
  }
}
