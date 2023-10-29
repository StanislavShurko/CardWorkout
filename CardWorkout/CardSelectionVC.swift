//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Stanislav Shurko on 29.10.23.
//

import UIKit

class CardSelectionVC: UIViewController {

    @IBOutlet var cardImageView: UIImageView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var cards: [UIImage] = Card.allValues;
    
    var timer: Timer!;
    
    override func viewDidLoad() {
        super.viewDidLoad();
        startTimer();
        
        for button in buttons {
            button.layer.cornerRadius = 8;
        }
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated);
        
        timer.invalidate();
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(showRandomImage), userInfo: nil, repeats: true)
    }
    
    @objc func showRandomImage() {
        cardImageView.image = cards.randomElement() ?? UIImage(named: "AS");
    }

    @IBAction func stopButtonTapped(_ sender: UIButton) {
        timer.invalidate();
    }
    
    @IBAction func restartButtonTapped(_ sender: Any) {
        timer.invalidate();
        startTimer();
    }
    
    @IBAction func unwindHome(_ segue: UIStoryboardSegue) {
            // this is intentionally blank
        }
}
