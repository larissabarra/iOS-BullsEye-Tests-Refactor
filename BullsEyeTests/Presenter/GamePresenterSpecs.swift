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
      }
      
      describe("reset") {
        it("starts a new game and resets rounds and score") {
          expect(gameMock.calledReset).to(beTrue())
          expect(gameMock.round).to(equal(1))
          expect(gameMock.score).to(equal(0))
        }
        
        it("calls view to update round count to 1, score to 0 and target") {
          expect(viewMock.calledUpdateRoundLabel).to(beTrue())
          expect(viewMock.calledUpdateRoundLabelWithValue).to(equal(1))
          
          expect(viewMock.calledUpdateScoreLabel).to(beTrue())
          expect(viewMock.calledUpdateScoreLabelWithValue).to(equal(0))
          
          expect(viewMock.calledUpdateTargetLabel).to(beTrue())
          expect(viewMock.calledUpdateTargetLabelWithValue).to(equal(gameMock.target))
        }
      }
      
      describe("newRound") {
        it("calls the game's new round method") {
          presenter.newRound()
          
          expect(gameMock.calledNewRound).to(beTrue())
        }
        
        it("calls the view to update round label with proper value") {
          let round = gameMock.round
          
          presenter.newRound()
          
          expect(viewMock.calledUpdateRoundLabel).to(beTrue())
          expect(viewMock.calledUpdateRoundLabelWithValue).to(equal(round+1))
        }
        
        it("calls the view to update target label with new value") {
          let target = gameMock.target
          
          presenter.newRound()
          
          expect(viewMock.calledUpdateTargetLabel).to(beTrue())
          expect(target).notTo(equal(gameMock.target))
          expect(viewMock.calledUpdateTargetLabelWithValue).to(equal(gameMock.target))
        }
        
        it("calls the view to update score label") {
          presenter.newRound()
          
          expect(viewMock.calledUpdateScoreLabel).to(beTrue())
        }
        
        it("calls the view to reset slider to 50") {
          presenter.newRound()
          
          expect(viewMock.calledSetSlider).to(beTrue())
          expect(viewMock.calledSetSliderWithValue).to(equal(50))
        }
      }
      
      describe("hit") {
        it("calls the game's hit method with proper value") {
          presenter.hit(value: 16)
          
          expect(gameMock.didCallHit).to(beTrue())
          expect(gameMock.didCallHitWithValue).to(equal(16))
        }
        
        it("calls view to show alert with score") {
          gameMock.score = 4
          
          presenter.hit(value: 16)
          
          expect(viewMock.calledShowAlert).to(beTrue())
          expect(viewMock.calledAlertWithTitle).to(equal("You almost had it!"))
          expect(viewMock.calledAlertWithPoints).to(equal(20))
        }
      }
      
      describe("alertDismissed") {
        it("calls view to update score") {
          gameMock.score = 999
          
          presenter.alertDismissed()
          
          expect(viewMock.calledUpdateScoreLabel).to(beTrue())
          expect(viewMock.calledUpdateScoreLabelWithValue).to(equal(999))
        }
      }
    }
  }
}
