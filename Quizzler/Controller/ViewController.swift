//
//  ViewController.swift
//  Quizzler
//
//  Created by Ilyas Tyumenev on 13.04.2023.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    private let backgroundImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Background-Bubbles")
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let stackView = StackView()
    var quizBrain = QuizBrain()
    
    // MARK: - Override Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        stackView.delegate = self
        setViews()
        setupConstraints()
        updateUI()
    }
    
    // MARK: - Private Methods
    private func setViews() {
        view.backgroundColor = UIColor(red: 37/255, green: 44/255, blue: 74/255, alpha: 1.0)
        view.addSubview(backgroundImageView)
        view.addSubview(stackView)
    }
    
    private func setupConstraints() {
        backgroundImageView.snp.makeConstraints { make in
            make.leading.equalTo(view.safeAreaLayoutGuide.snp.leading)
            make.trailing.equalTo(view.safeAreaLayoutGuide.snp.trailing)
            make.bottom.equalToSuperview()
            make.height.equalTo(102)
        }
        
        stackView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalTo(view.snp.leadingMargin)
            make.trailing.equalTo(view.snp.trailingMargin)
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
        }
    }
}

// MARK: - StackViewDelegate
extension ViewController: StackViewDelegate {
    
    func stackView(_ view: StackView, answerButtonPressed button: UIButton) {
        let userAnswer = button.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            button.backgroundColor = .green
        } else {
            button.backgroundColor = .red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.2, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
}

// MARK: - Target Actions
private extension ViewController {
    
    @objc func updateUI() {
        stackView.questionLabel.text = quizBrain.getQuestionText()
        
        let answerChoices = quizBrain.getAnswers()
        stackView.choice1Button.setTitle(answerChoices[0], for: .normal)
        stackView.choice2Button.setTitle(answerChoices[1], for: .normal)
        stackView.choice3Button.setTitle(answerChoices[2], for: .normal)
        
        stackView.progressView.progress = quizBrain.getProgress()
        stackView.scoreLabel.text = "Score \(quizBrain.getScore())"
        
        stackView.choice1Button.backgroundColor = .clear
        stackView.choice2Button.backgroundColor = .clear
        stackView.choice3Button.backgroundColor = .clear
    }
}
