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
    view?.updateScoreLabel(value: game.score)
  }
  
  func hit(value: Int) {
    _ = game.hit(guess: value)
    view?.updateScoreLabel(value: game.score)
  }
}
