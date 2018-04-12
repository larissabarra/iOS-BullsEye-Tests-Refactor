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
    updateLabels()
  }
  
  func newRound() {
    game.newRound()
    updateLabels()
    view?.setSlider(value: 50)
  }
  
  func hit(value: Int) {
    _ = game.hit(guess: value)
    newRound()
  }
  
  private func updateLabels() {
    view?.updateScoreLabel(value: game.score)
    view?.updateRoundLabel(value: game.round)
    view?.updateTargetLabel(value: game.target)
  }
}
