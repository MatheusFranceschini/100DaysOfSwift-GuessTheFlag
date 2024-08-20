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
        "south africa",
        "egypt",
        "finland",
        "sweden",
        "greece",
        "india",
        "ireland",
        "italy",
        "jamaica",
        "japan",
        "mexico",
        "germany",
        "portugal",
        "philippines",
        "russia",
        "south korea",
        "switzerland",
        "turkey",
        "usa"
    ]
    
    var score: Int = 0
    var correctAnswer: Int = 0
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Guess the flag"
        label.font = .systemFont(ofSize: 40, weight: .bold)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "teste"
        label.font = .systemFont(ofSize: 24, weight: .regular)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var button1: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.tag = 0
        return button
    }()
    
    private lazy var button2: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.tag = 1
        return button
    }()
    
    private lazy var button3: UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 16
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.lightGray.cgColor
        button.imageView?.contentMode = .scaleAspectFill
        button.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        button.tag = 2
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
        view.addSubview(countryLabel)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            countryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button1.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 32),
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
    
    func askQuestion(action: UIAlertAction! = nil) {
        
        countries.shuffle()
        correctAnswer = Int.random(in: 0...2)
        
        button1.setImage(UIImage(named: countries[0]), for: .normal)
        button2.setImage(UIImage(named: countries[1]), for: .normal)
        button3.setImage(UIImage(named: countries[2]), for: .normal)
        
        countryLabel.text = countries[correctAnswer].uppercased()
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        var title: String
        
        if sender.tag == correctAnswer {
            title = "Correct answer"
            score += 1
        } else {
            title = "Wrong answer"
        }
        
        let alert = UIAlertController(title: title, message: "Your score is \(score)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alert, animated: true)
    }

}
