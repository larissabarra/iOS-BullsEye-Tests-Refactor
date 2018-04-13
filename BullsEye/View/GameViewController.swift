import UIKit

class GameViewController: UIViewController {
  var presenter: GamePresenter?
  
  @IBOutlet weak var slider: UISlider!
  @IBOutlet weak var targetLabel: UILabel!
  @IBOutlet weak var scoreLabel: UILabel!
  @IBOutlet weak var roundLabel: UILabel!
  @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
  
  @IBAction func hitMeTapped() {
    let guess: Int = Int(slider.value)
    presenter?.hit(value: guess)
  }
  
  @IBAction func sliderMoved(_ slider: UISlider) {
    
  }
  
  @IBAction func startNewGame() {
    
  }
  
  func updateScoreLabel(value: Int) {
    scoreLabel.text = String(value)
  }
  
  func updateRoundLabel(value: Int) {
    roundLabel.text = String(value)
  }
  
  func updateTargetLabel(value: Int) {
    targetLabel.text = String(value)
  }
  
  func setSlider(value: Int) {
    slider.value = Float(value)
  }
  
  func showAlert(title: String, points: Int) {
    let alert = UIAlertController(title: title, message: "You scored \(points) points", preferredStyle: .alert)
    
    let action = UIAlertAction(title: "OK", style: .default, handler: nil)
    
    alert.addAction(action)
    present(alert, animated: true, completion: nil)
  }
  
  override func viewDidLoad() {
    presenter = GamePresenter(view: self)
  }
}
