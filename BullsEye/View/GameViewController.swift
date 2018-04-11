import UIKit

class GameViewController: UIViewController {
  weak var presenter: GamePresenter?
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  @IBAction func hitMeTapped() {
    
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    
  }
  
  @IBAction func startNewGame() {
    
  }
  
  func updateScoreLabel(value: Int) {
    scoreLabel.text = String(value)
  }
}
