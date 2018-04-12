import Quick
import Nimble

@testable import BullsEye

class GamePresenterSpecs: QuickSpec {
  override func spec() {
    describe("GamePresenter") {
      
      var gameMock: GameMock!
      var viewMock: GameViewMock!
      var presenter: GamePresenter!
      
      beforeEach {
        gameMock = GameMock()
        viewMock = GameViewMock()
        presenter = GamePresenter(view: viewMock, game: gameMock)
      }
      
      afterEach {
        gameMock = nil
        viewMock = nil
        presenter = nil
      }
      
      describe("init") {
        it("starts with a GameViewController") {
          expect(presenter.view).to(equal(viewMock))
        }
        
        it("starts with a Game instance") {
          expect(presenter.game).to(beAKindOf(Game.self))
        }
        
        it("starts a new game and resets rounds and score") {
          expect(gameMock.calledReset).to(beTrue())
          expect(gameMock.round).to(equal(1))
          expect(gameMock.score).to(equal(0))
        }
        
        fit("calls view to update round count to 1 and score to 0") {
          expect(viewMock.calledUpdateRoundLabel).to(beTrue())
          expect(viewMock.calledUpdateRoundLabelWithValue).to(equal(1))
          expect(viewMock.didCallUpdateScoreLabel).to(beTrue())
          expect(viewMock.didCallUpdateScoreLabelWithValue).to(equal(0))
        }
      }
      
      describe("hit") {
        it("calls the game's hit method with proper value") {
          presenter.hit(value: 16)
          
          expect(gameMock.didCallHit).to(beTrue())
          expect(gameMock.didCallHitWithValue).to(equal(16))
        }
        
        it("calls view to update score") {
          gameMock.score = 999
          
          presenter.hit(value: 16)
          
          expect(viewMock.didCallUpdateScoreLabel).to(beTrue())
          expect(viewMock.didCallUpdateScoreLabelWithValue).to(equal(999))
        }
      }
    }
  }
}
