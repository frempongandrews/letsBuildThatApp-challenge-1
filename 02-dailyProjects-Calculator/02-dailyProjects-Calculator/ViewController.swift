//
//  ViewController.swift
//  02-dailyProjects-Calculator
//
//  Created by Andrews Frempong on 06/10/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    var buttonsArr: [UIButton] = []
    var buttonTitles = ["None", "Add", "Subtract", "Multiply", "Divide", "Compute"]
    var leftAnchor:NSLayoutXAxisAnchor?
    
    
    //<!-- operator label -->
    
    let operatorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .red
        label.text = "+"
        label.textAlignment = .center
        
        label.layer.masksToBounds = true //for cornerRadius
        label.layer.cornerRadius = 5
        
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //<!-- first number -->
    
    let firstNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "X"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //<!-- second number -->
    
    let secondNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Y"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    //<!-- Result label-->
    let resultLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.text = "Result"
        label.textAlignment = .right
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //<!-- Operators container-->
    
    
    let operatorsContainerView: UIView = {
        let v = UIView()
        v.backgroundColor = .green
        v.layer.borderColor = UIColor.red.cgColor
        v.layer.borderWidth = 1
        
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setupLayout ()
    }
    
    
    //<!-- Main operations-->
    
    func handleNone () {
        operatorLabel.text = ""
        print("handling none")
    }
    
    func handleAdd () {
        operatorLabel.text = "+"
    }
    
    func handleSubtract () {
        operatorLabel.text = "-"
    }
    
    func handleMultiply () {
        operatorLabel.text = "*"
    }
    
    func handleDivide() {
        operatorLabel.text = "/"
    }
    
    
    //TODO LOGIC
    
    func handleCompute () {
        
        var calculationIsReady = false
        var firstNumberIsReady = false
        var secondNumberIsReady = false
        var operatorIsReady = false
        if let firstNum = firstNumberTextField.text {
            if firstNum == "" {
                print("Please insert first number")
            } else {
                firstNumberIsReady = true
            }
        }
        
        if let secondNum = secondNumberTextField.text {
            if secondNum == "" {
                print("Please insert second number")
            } else {
                secondNumberIsReady = true
            }
        }
        
        if let op = operatorLabel.text {
            if op == "" {
                print("Please operator")
            } else {
                operatorIsReady = true
            }
        }
        
        
        //ready for calculation
        if firstNumberIsReady && secondNumberIsReady && operatorIsReady {
            //print("yay!!")
            
            //adding
            if operatorLabel.text == "+" {
                
                if let firstNum = firstNumberTextField.text, let secondNum = secondNumberTextField.text {
                    let result = Int(firstNum)! + Int(secondNum)!
                    resultLabel.text = String(describing: result)
                }
                
                
            }//<!-- end of nigeria
        }
        
        
        
    }
    
    
    var functionsArr = [handleNone, handleAdd, handleSubtract, handleMultiply, handleDivide, handleCompute]

    
    func setupLayout () {
        
        
        
        //<!-- container -->
        let containerView: UIView = {
           let v = UIView()
//            v.backgroundColor = .green
            v.layer.borderColor = UIColor.red.cgColor
            v.layer.borderWidth = 1
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        //add container to screen
        
        self.view.addSubview(containerView)
        
        //constraints
        
        containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 5).isActive = true
        containerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -5).isActive = true
        containerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -5).isActive = true
        
        

        
        containerView.addSubview(firstNumberTextField)
        
        //constraints
        
        firstNumberTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        firstNumberTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        firstNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        firstNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        
        
        //<!-- Operator Label-->
        
        containerView.addSubview(operatorLabel)
        
        //constraints
        
        operatorLabel.leftAnchor.constraint(equalTo: firstNumberTextField.rightAnchor, constant: 10).isActive = true
        operatorLabel.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        operatorLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        operatorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
       //<!-- Second number -->
        containerView.addSubview(secondNumberTextField)
        
        //constraints
        
        secondNumberTextField.leftAnchor.constraint(equalTo: operatorLabel.rightAnchor, constant: 10).isActive = true
        secondNumberTextField.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        secondNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        secondNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        //<!-- Result label -->
        
        containerView.addSubview(resultLabel)
        
        //constraints
        
        resultLabel.leftAnchor.constraint(equalTo: secondNumberTextField.rightAnchor, constant: 8).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        
        
   
        //<!--Operators container -->
        
        //add container to screen
        
        containerView.addSubview(operatorsContainerView)
        
        //constraints
        
        operatorsContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5).isActive = true
        operatorsContainerView.topAnchor.constraint(equalTo: firstNumberTextField.bottomAnchor, constant: 15).isActive = true
        operatorsContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5).isActive = true
        operatorsContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        
        
        
        
        //<!-- Creating 4 buttons with for loop-->
        
        
        //print(type(of: leftAnchor))
        for i in 0...5 {
            let button = UIButton()
            button.setTitle(buttonTitles[i], for: .normal)
            button.backgroundColor = .red
            button.layer.borderColor = UIColor.black.cgColor
            button.layer.borderWidth = 1
            button.translatesAutoresizingMaskIntoConstraints = false
            
            
            //creating 4 operation buttons
            
            if i >= 0 && i <= 4 {
                
                if buttonsArr.count == 0 {
                    leftAnchor = operatorsContainerView.leftAnchor
                } else if buttonsArr.count == 1{
                    leftAnchor = buttonsArr[0].rightAnchor
                } else {
                    leftAnchor = buttonsArr[i - 1].rightAnchor
                }
                
                buttonsArr.append(button)
                
                //show button
                operatorsContainerView.addSubview(button)
                
                //the only variable that changes is the left anchor
                
                button.leftAnchor.constraint(equalTo: leftAnchor!, constant: 0).isActive = true
                button.widthAnchor.constraint(equalTo: operatorsContainerView.widthAnchor, multiplier: 0.20).isActive = true
                button.heightAnchor.constraint(equalToConstant: 50).isActive = true
                
                
                //set Y anchor
                
                button.centerYAnchor.constraint(equalTo: operatorsContainerView.centerYAnchor, constant: 0).isActive = true
                
            } else {//compute button
                
                button.setTitle("Compute", for: .normal)
                button.backgroundColor = .white
                button.setTitleColor(.red, for: .normal)
                buttonsArr.append(button)
            
                
                //add to view
                
                containerView.addSubview(button)
                
                //constraints
                
                button.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
                button.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
                button.topAnchor.constraint(equalTo: operatorsContainerView.bottomAnchor, constant: 10).isActive = true
                
                print(buttonTitles[i])
            }
            
            
            
            
        } //<!-- End Creating 4 buttons with for loop-->
        
        
        
        buttonsArr[0].addTarget(self, action: #selector(handleNone), for: .touchUpInside)
        buttonsArr[1].addTarget(self, action: #selector(handleAdd), for: .touchUpInside)
        buttonsArr[2].addTarget(self, action: #selector(handleSubtract), for: .touchUpInside)
        buttonsArr[3].addTarget(self, action: #selector(handleMultiply), for: .touchUpInside)
        buttonsArr[4].addTarget(self, action: #selector(handleDivide), for: .touchUpInside)
        buttonsArr[5].addTarget(self, action: #selector(handleCompute), for: .touchUpInside)
        
       
       
        
        
    }//<!-- End of setupLayout -->
        
        
        
    
    
    
    



}

