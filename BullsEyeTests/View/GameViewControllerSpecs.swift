import Quick
import Nimble

@testable import BullsEye

class GameViewControllerSpecs: QuickSpec {
  
  var viewController: GameViewController!
  
  override func spec() {
    describe("GameViewController") {
      
      beforeEach {
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        self.viewController = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        
        self.viewController.loadView()
      }
      
      afterEach {
        self.viewController = nil
      }
      
      describe("hitMeTapped") {
        it("calls presenter's hit method with slider value") {
          let presenterMock = GamePresenterMock(view: self.viewController)
          self.viewController.presenter = presenterMock
          self.viewController.slider.value = 16
          
          self.viewController.hitMeTapped()
          
          expect(presenterMock.calledHit).to(beTrue())
          expect(presenterMock.hitValue).to(equal(16))
        }
      }
      
      describe("updateScoreLabel") {
        it("updates label with proper value") {
          self.viewController.updateScoreLabel(value: 10)
          
          expect(self.viewController.scoreLabel.text).to(equal("10"))
        }
      }
      
      describe("updateRoundLabel") {
        it("updates label with proper value") {
          self.viewController.updateRoundLabel(value: 10)
          
          expect(self.viewController.roundLabel.text).to(equal("10"))
        }
      }
      
      describe("updateTargetLabel") {
        it("updates label with proper value") {
          self.viewController.updateTargetLabel(value: 10)
          
          expect(self.viewController.targetLabel.text).to(equal("10"))
        }
      }
      
      describe("setSlider") {
        it("resets slider with proper value") {
          self.viewController.slider.value = 0
          self.viewController.setSlider(value: 50)
          
          expect(self.viewController.slider.value).to(equal(50))
        }
      }
      
      describe("showAlert") {
        it("shows an alert telling the guess was perfect") {
          UIApplication.shared.keyWindow?.rootViewController = self.viewController
          
          self.viewController.showAlert(title: "Perfect!", points: 200)
          
          let alertController = self.viewController.presentedViewController as! UIAlertController
          expect(alertController.title).to(equal("Perfect!"))
          expect(alertController.message).to(equal("You scored 200 points"))
        }
      }
    }
  }
}
