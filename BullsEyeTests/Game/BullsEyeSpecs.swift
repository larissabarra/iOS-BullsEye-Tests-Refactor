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
        it("resets score to 0") {
          _ = bullsEye.hit(guess: 90)
          
          bullsEye.reset()
          
          expect(bullsEye.score).to(equal(0))
        }
        
        it("resets round to 1") {
          bullsEye.newRound()
          
          bullsEye.reset()
          
          expect(bullsEye.round).to(equal(1))
        }
        
        it("generates new target value") {
          let oldTarget = bullsEye.target
          
          bullsEye.reset()
          
          expect(bullsEye.target).notTo(equal(oldTarget))
        }
      }
      
      describe("target") {
        it("is between 0 and 100") {
          expect(bullsEye.target).to(beGreaterThanOrEqualTo(0))
          expect(bullsEye.target).to(beLessThanOrEqualTo(100))
        }
      }
      
      describe("hit") {
        it("returns 100 points + 100 bonus points for perfect guess") {
          let target = bullsEye.target
          let points = bullsEye.hit(guess: target)
          expect(points).to(equal(200))
        }
        
        it("returns 99 points + 50 bonus points for almost perfect guess") {
          let target = bullsEye.target
          let points = bullsEye.hit(guess: abs(target-1))
          expect(points).to(equal(149))
        }
        
        it("returns less than 100 points for wrong guess") {
          let target = bullsEye.target
          let points = bullsEye.hit(guess: abs(target-50))
          expect(points).to(beLessThan(100))
        }
        
        it("increments score for every guess that gives non zero score") {
          let previousScore = bullsEye.score
          
          _ = bullsEye.hit(guess: 1)
          
          expect(bullsEye.score).to(beGreaterThan(previousScore))
        }
      }
    }
  }
}
