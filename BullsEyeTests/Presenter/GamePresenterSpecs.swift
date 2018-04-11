import Quick
import Nimble

@testable import BullsEye

class GamePresenterSpecs: QuickSpec {
  override func spec() {
    describe("GamePresenter") {
      describe("init") {
        it("starts with a GameViewController") {
          let view = GameViewController()
          let presenter = GamePresenter(view: view)
          
          expect(presenter.view).to(equal(view))
        }
        
        it("starts with a Game instance") {
          let presenter = GamePresenter(view: GameViewController())
          
          expect(presenter.game).to(beAKindOf(Game.self))
        }
      }
      
      describe("hit") {
        it("calls the game's hit method with proper value") {
          let gameMock = GameMock()
          let presenter = GamePresenter(view: GameViewMock(), game: gameMock)
          
          presenter.hit(value: 16)
          
          expect(gameMock.didCallHit).to(beTrue())
          expect(gameMock.didCallHitWithValue).to(equal(16))
        }
        
        it("calls view to update score") {
          let gameMock = GameMock()
          let viewMock = GameViewMock()
          let presenter = GamePresenter(view: viewMock, game: gameMock)
          gameMock.score = 999
          
          presenter.hit(value: 16)
          
          expect(viewMock.didCallUpdateScoreLabel).to(beTrue())
          expect(viewMock.didCallUpdateScoreLabelWithValue).to(equal(999))
        }
      }
    }
  }
}
