class GamePresenter {
  weak var view: GameViewController?
  let game: Game
  
  init(view: GameViewController, game: Game = BullsEye()) {
    self.view = view
    self.game = game
    
    self.view?.presenter = self
    
    game.reset()
  }
  
  func hit(value: Int) {
    _ = game.hit(guess: value)
    view?.updateScoreLabel(value: game.score)
  }
}
