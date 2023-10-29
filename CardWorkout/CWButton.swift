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
        translatesAutoresizingMaskIntoConstraints = false;
    }

}
