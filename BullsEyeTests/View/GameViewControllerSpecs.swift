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
      
      describe("updateScoreLabel") {
        it("updates label with proper value") {
          self.viewController.updateScoreLabel(value: 10)
          
          expect(self.viewController.scoreLabel.text).to(equal("10"))
        }
      }
    }
  }
}
