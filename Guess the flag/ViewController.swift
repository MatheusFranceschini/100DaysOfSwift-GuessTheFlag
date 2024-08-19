//
//  ViewController.swift
//  Guess the flag
//
//  Created by Matheus Franceschini on 16/08/24.
//

import UIKit

class ViewController: UIViewController {
    
    var countries: [String] = [
        "argentina",
        "australia",
        "brazil",
        "canada",
        "chile",
        "china",
        "colombia",
        "egypt",
        "finland",
        "france",
        "greece", 
        "india",
        "ireland",
        "italy",
        "jamaica",
        "japan",
        "mexico",
        "netherlands",
        "nigeria",
        "philippines",
        "russia",
        "south-korea",
        "switzerland",
        "turkey",
        "usa"
    ]
    
    var score: Int = 0
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Guess the flag"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var button1: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.setImage(UIImage(named: "usa"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private lazy var button2: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.setImage(UIImage(named: "india"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()
    
    private lazy var button3: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.setImage(UIImage(named: "mexico"), for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.imageView?.contentMode = .scaleAspectFill
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        askQuestion()
        // Do any additional setup after loading the view.
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button1.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 32),
            button1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button1.widthAnchor.constraint(equalToConstant: 320),
            button1.heightAnchor.constraint(equalToConstant: 160),
            
            button2.topAnchor.constraint(equalTo: button1.bottomAnchor, constant: 32),
            button2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button2.widthAnchor.constraint(equalToConstant: 320),
            button2.heightAnchor.constraint(equalToConstant: 160),
            
            button3.topAnchor.constraint(equalTo: button2.bottomAnchor, constant: 32),
            button3.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            button3.widthAnchor.constraint(equalToConstant: 320),
            button3.heightAnchor.constraint(equalToConstant: 160)
        ])
    }
    
    func askQuestion() {
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
    }

}
//
//#Preview {
//    ViewController()
//}
