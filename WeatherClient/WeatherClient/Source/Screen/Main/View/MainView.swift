//
//  MainView.swift
//  WeatherClient
//
//  Created by Алина Власенко on 06.06.2024.
//

import UIKit

class MainView: UIView {
    
    weak var delegate: MainViewDelegate?
    
    // to temporarily test the data display
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // to temporarily test the data display
    func setupUI() {
        backgroundColor = .blue
        label.textColor = .white
        label.font = .systemFont(ofSize: 54.0)
        label.textAlignment = .center
    }
    
    // to temporarily test the data display
    func setupLayout() {
        
        label.translatesAutoresizingMaskIntoConstraints = false
        addSubview(label)
        
        let labelConstraint: [NSLayoutConstraint] = [
            label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constant.labelSideOffset),
            label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constant.labelSideOffset),
            label.topAnchor.constraint(equalTo: topAnchor, constant: Constant.labelSideOffset),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -Constant.labelSideOffset)
        ]
        NSLayoutConstraint.activate(labelConstraint)
    }
}

// MARK: - MainViewProtocol
extension MainView: MainViewProtocol {
    
    // displaying data on screen UI elements
    func setupWeather(text: String) {
        label.text = text
    }
}
