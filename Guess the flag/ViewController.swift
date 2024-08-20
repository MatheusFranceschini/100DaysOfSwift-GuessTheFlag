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
    var currentQuestion: Int = 1
    
    private lazy var titleLabel: UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Guess the flag"
        label.font = .boldSystemFont(ofSize: 32)
        label.textColor = .black
        label.textAlignment = .center
        return label
    }()
    
    private lazy var countryLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 16, weight: .semibold)
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
    
    private lazy var scoreLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Your score: 0"
        label.font = .systemFont(ofSize: 16)
        label.textAlignment = .center
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        askQuestion()
    }
    
    private func setup() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(titleLabel)
        view.addSubview(countryLabel)
        view.addSubview(button1)
        view.addSubview(button2)
        view.addSubview(button3)
        view.addSubview(scoreLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            countryLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 16),
            countryLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            button1.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 24),
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
            button3.heightAnchor.constraint(equalToConstant: 160),
            
            scoreLabel.topAnchor.constraint(equalTo: button3.bottomAnchor, constant: 32),
            scoreLabel.leadingAnchor.constraint(equalTo: button3.leadingAnchor)
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
    
    func restartGame(action: UIAlertAction! = nil) {
        score = 0
        currentQuestion = 1
        scoreLabel.text = "Your score: 0"
        askQuestion()
    }
    
    @objc func buttonPressed(_ sender: UIButton) {
        
        var title: String
        var correct: Bool = true
        
        
        
        if sender.tag == correctAnswer {
            title = "Correct answer"
            correct = true
            score += 1
            scoreLabel.text = "Your score: \(score)"
        } else {
            title = "Wrong answer"
            correct = false
        }
        
        let alert = UIAlertController(title: title, message: correct ? "Your score is \(score)" : "This is \(countries[sender.tag].uppercased())", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Continue", style: .default, handler: askQuestion))
        present(alert, animated: true)
        
        
        if currentQuestion == 10 {
            alert.title = "Game Over!"
            alert.message = "Your final score is \(score)"
            alert.addAction(UIAlertAction(title: "Restart", style: .default, handler: restartGame))
        }
        
        currentQuestion += 1
        
    }
    
    
    
}

#Preview {
    ViewController()
}
