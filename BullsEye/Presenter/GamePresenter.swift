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
    let roundResult = game.hit(guess: value)
    view?.showAlert(title: roundResult.perfection.rawValue, points: roundResult.score)
  }
  
  func alertDismissed() {
    newRound()
  }
  
  private func updateLabels() {
    view?.updateScoreLabel(value: game.score)
    view?.updateRoundLabel(value: game.round)
    view?.updateTargetLabel(value: game.target)
  }
}
