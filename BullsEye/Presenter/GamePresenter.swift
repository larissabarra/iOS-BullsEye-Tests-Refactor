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
    view?.updateRoundLabel(value: game.round)
    updateScoreLabel()
    updateTargetLabel()
  }
  
  func hit(value: Int) {
    _ = game.hit(guess: value)
    updateScoreLabel()
  }
  
  private func updateScoreLabel() {
    view?.updateScoreLabel(value: game.score)
  }
  
  private func updateTargetLabel() {
    view?.updateTargetLabel(value: game.target)
  }
}
