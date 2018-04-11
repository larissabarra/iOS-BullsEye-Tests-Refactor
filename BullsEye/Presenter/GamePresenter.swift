class GamePresenter {
  weak var view: GameViewController?
  let game: Game
  
  init(view: GameViewController, game: Game = BullsEye()) {
    self.view = view
    self.game = game
    
    self.view?.presenter = self
  }
  
  func hit(value: Int) {
    _ = game.hit(guess: value)
    view?.updateScoreLabel(value: game.score)
  }
}
