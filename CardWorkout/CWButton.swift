//
//  CWButton.swift
//  CardWorkout
//
//  Created by Stanislav Shurko on 29.10.23.
//

import UIKit

class CWButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame);
        configure();
    }
    
    required init?(coder: NSCoder) {
        fatalError("coder was not implemented");
    }
    
    init(backgroudColor: UIColor, title: String) {
        super.init(frame: .zero);
        self.backgroundColor = backgroudColor;
        setTitle(title, for: .normal);
        configure();
    }

    func configure() {
        layer.cornerRadius = 8;
        titleLabel?.font = .systemFont(ofSize: 19, weight: .bold);
        setTitleColor(.white, for: .normal);
        
        startAnimatingPressActions();
    
        translatesAutoresizingMaskIntoConstraints = false;
    }
    
    
       func startAnimatingPressActions() {
           addTarget(self, action: #selector(animateDown), for: [.touchDown, .touchDragEnter])
           addTarget(self, action: #selector(animateUp), for: [.touchDragExit, .touchCancel, .touchUpInside, .touchUpOutside])
       }
       
       @objc private func animateDown(sender: UIButton) {
           animate(sender, transform: CGAffineTransform.identity.scaledBy(x: 0.95, y: 0.95))
       }
       
       @objc private func animateUp(sender: UIButton) {
           animate(sender, transform: .identity)
       }
       
       private func animate(_ button: UIButton, transform: CGAffineTransform) {
           UIView.animate(withDuration: 0.4,
                          delay: 0,
                          usingSpringWithDamping: 0.5,
                          initialSpringVelocity: 3,
                          options: [.curveEaseInOut],
                          animations: {
                           button.transform = transform
               }, completion: nil)
       }

}
