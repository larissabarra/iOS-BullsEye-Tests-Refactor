import Quick
import Nimble

@testable import BullsEye

class BullsEyeSpecs: QuickSpec {
  override func spec() {
    
    var bullsEye: BullsEye!
    
    beforeEach {
      bullsEye = BullsEye()
    }
    
    describe("BullsEye Game") {
      it("conforms with game protocol") {
        expect(bullsEye).to(beAKindOf(Game.self))
      }
    
      //nome do atributo ou método a ser testado
      describe("round") {
        it("begins with 1") {
          expect(bullsEye.round).to(equal(1))
        }
      }
      
      describe("newRound") {
        it("increments round") {
          bullsEye.newRound()
          bullsEye.newRound()
          
          expect(bullsEye.round).to(equal(3))
        }
        
        it("changes target to new number") {
          let firstTarget = bullsEye.target
          
          bullsEye.newRound()
          let nextTarget = bullsEye.target
          
          expect(firstTarget).notTo(equal(nextTarget))
        }
      }
      
      describe("reset") {
        it("resets score") {
          expect(bullsEye.score).to(equal(0))
        }
        
        it("resets round to 1") {
          bullsEye.newRound()
          expect(bullsEye.round).to(equal(2))
          
          bullsEye.reset()
          expect(bullsEye.round).to(equal(1))
        }
      }
      
      describe("target") {
        it("is between 0 and 100") {
          expect(bullsEye.target).to(beGreaterThanOrEqualTo(0))
          expect(bullsEye.target).to(beLessThanOrEqualTo(100))
        }
      }
    }
  }
}
