//
//  Stack.swift
//  Quizzler
//
//  Created by Ilyas Tyumenev on 01.08.2023.
//

import UIKit
import SnapKit

protocol StackViewDelegate: AnyObject {
    func stackView(_ view: StackView, answerButtonPressed button: UIButton)
}

class StackView: UIView {
    
    // MARK: - Properties
    weak var delegate: StackViewDelegate?
    
    let scoreLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    let questionLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.textColor = .white
        label.textAlignment = .justified
        label.numberOfLines = 0
        return label
    }()
    
    lazy var choice1Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choice 1", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var choice2Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choice 2", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    lazy var choice3Button: UIButton = {
        let button = UIButton()
        button.setTitle("Choice 3", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 25)
        button.setTitleColor(.white, for: .normal)
        button.contentHorizontalAlignment = .center
        button.setBackgroundImage(UIImage(named: "Rectangle"), for: .normal)
        button.addTarget(self, action: #selector(answerButtonPressed), for: .touchUpInside)
        return button
    }()
    
    let progressView: UIProgressView = {
        let progressBar = UIProgressView()
        progressBar.progressViewStyle = .bar
        progressBar.progress = 0
        progressBar.tintColor = UIColor(red: 255/255, green: 117/255, blue: 168/255, alpha: 1.0)
        progressBar.trackTintColor = .white
        return progressBar
    }()
    
    lazy var stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillProportionally
        stack.spacing = 10
        [self.scoreLabel,
         self.questionLabel,
         self.choice1Button,
         self.choice2Button,
         self.choice3Button,
         self.progressView].forEach { stack.addArrangedSubview($0) }
        return stack
    }()
    
    // MARK: - Initializers
    override init(frame: CGRect) {
        super.init(frame: frame)
        setSubviews()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setSubviews() {
        addSubview(stackView)
    }
    
    private func setupConstraints() {        
        stackView.snp.makeConstraints { (make) in
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
            make.bottom.equalTo(safeAreaLayoutGuide.snp.bottom)
            make.leading.trailing.equalToSuperview()
        }

        scoreLabel.snp.makeConstraints { make in
        }
        
        questionLabel.snp.makeConstraints { make in
        }
        
        choice1Button.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        choice2Button.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        choice3Button.snp.makeConstraints { make in
            make.height.equalTo(80)
        }
        
        progressView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(10)
        }
    }
}

// MARK: - Target Actions
private extension StackView {
    
    @objc func answerButtonPressed(_ button: UIButton) {
        delegate?.stackView(self, answerButtonPressed: button)
    }
}
