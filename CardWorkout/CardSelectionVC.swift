//
//  CardSelectionVC.swift
//  CardWorkout
//
//  Created by Stanislav Shurko on 29.10.23.
//

import UIKit

class CardSelectionVC: UIViewController {
    
    let cardImageView = UIImageView();
    
    let stopButton = CWButton(backgroudColor: .systemBlue, title: "Stop!");
    let restartButton = CWButton(backgroudColor: .systemGreen, title: "Restart");
    let rulesButton = CWButton(backgroudColor: .systemGray, title: "Rules");
    
    var cards = Card.allValues;
    var timer: Timer!;

    override func viewDidLoad() {
        super.viewDidLoad();
        view.backgroundColor = .systemBackground;
        configureUI();
        startTimer();
    }
    
    func configureUI() {
        configureCardImageView();
        configureStopButton();
        configureRestartButton();
        configureRulesButton();
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
    }
    
    @objc func changeImage() {
        cardImageView.image = Card.allValues.randomElement();
    }
    
    func configureCardImageView() {
        view.addSubview(cardImageView);
        
        cardImageView.translatesAutoresizingMaskIntoConstraints = false;
        cardImageView.image = UIImage(named: "AS");
        
        NSLayoutConstraint.activate([
            cardImageView.widthAnchor.constraint(equalToConstant: 250),
            cardImageView.heightAnchor.constraint(equalToConstant: 350),
            cardImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
            
        ])
    }
    
    func configureStopButton() {
        view.addSubview(stopButton);
        
        stopButton.addTarget(self, action: #selector(stopTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            stopButton.widthAnchor.constraint(equalToConstant: 250),
            stopButton.heightAnchor.constraint(equalToConstant: 50),
            stopButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stopButton.topAnchor.constraint(equalTo: cardImageView.bottomAnchor, constant: 30)
        ])
    }
    
    @objc func stopTimer() {
        timer.invalidate();
    }
    
    func configureRestartButton() {
        view.addSubview(restartButton);
        
        restartButton.addTarget(self, action: #selector(restartTimer), for: .touchUpInside)
        
        NSLayoutConstraint.activate([
            restartButton.widthAnchor.constraint(equalToConstant: 115),
            restartButton.heightAnchor.constraint(equalToConstant: 50),
            restartButton.leadingAnchor.constraint(equalTo: stopButton.leadingAnchor),
            restartButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }
    
    @objc func restartTimer() {
        timer.invalidate()
        startTimer();
    }
    
    @objc func presentRulesVC() {
        present(RulesVC(), animated: true);
    }
    
    func configureRulesButton() {
        view.addSubview(rulesButton);
        
        rulesButton.addTarget(self, action: #selector(presentRulesVC), for: .touchUpInside);
        
        NSLayoutConstraint.activate([
            rulesButton.widthAnchor.constraint(equalToConstant: 115),
            rulesButton.heightAnchor.constraint(equalToConstant: 50),
            rulesButton.trailingAnchor.constraint(equalTo: stopButton.trailingAnchor),
            rulesButton.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
        ])
    }
}
