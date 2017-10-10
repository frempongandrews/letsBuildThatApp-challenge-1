//
//  ViewController.swift
//  02-dailyProjects-Calculator-using-uiSegmentedControl
//
//  Created by Andrews Frempong on 10/10/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let operators = ["None", "Add", "Subtract", "Multiply", "Divide"]
    
    let operatorLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .white
        label.text = ""
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
        textField.backgroundColor = .white
        textField.textAlignment = .center
        textField.keyboardType = .decimalPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    //<!-- second number -->
    
    let secondNumberTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Y"
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .white
        textField.keyboardType = .decimalPad
        textField.textAlignment = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    
    //<!-- Result label-->
    let resultLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .lightGray
        label.layer.borderWidth = 0
        label.text = "Result"
        label.textAlignment = .right
        label.isUserInteractionEnabled = false
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //<!-- Compute Button-->
    
    let computeButton: UIButton = {
       let button = UIButton()
        button.setTitle("Compute", for: .normal)
        button.backgroundColor = .white
        button.setTitleColor(.red, for: .normal)
        button.layer.borderColor = UIColor.red.cgColor
        button.layer.borderWidth = 1
        
        //deactivate frame
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        
        setupScreen()
        
    }//<!-- end viewDidLoad -->
    
    @objc func handleCompute () {
        print("Compute pressed")
        
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
                print("Please insert operator")
            } else {
                operatorIsReady = true
            }
        }
        
        //ready for calculation
        if firstNumberIsReady && secondNumberIsReady && operatorIsReady {
            //print("yay!!")
            
         
            
            //adding
            
            //////<!!-- UNCOMMENT THIS AREA FOR PREVIOUS RESULT --> ////////////////////////
            
            if operatorLabel.text == "+" {
                
                if let firstNum = firstNumberTextField.text, let secondNum = secondNumberTextField.text {
                    let result = Float(firstNum)! + Float(secondNum)!
                    resultLabel.text = String(describing: result)
                    
                }
                
            }//<!-- end of adding -->
            
            //subtracting
            
            if operatorLabel.text == "-" {
                
                if let firstNum = firstNumberTextField.text, let secondNum = secondNumberTextField.text {
                    let result = Float(firstNum)! - Float(secondNum)!
                    resultLabel.text = String(describing: result)
                }
                
            }//<!-- end of subtracting -->
            
            
            //multiply
            if operatorLabel.text == "*" {
                
                if let firstNum = firstNumberTextField.text, let secondNum = secondNumberTextField.text {
                    let result = Float(firstNum)! * Float(secondNum)!
                    resultLabel.text = String(describing: result)
                }
                
            }//<!-- end of multiply -->
            
            
            //divide
            if operatorLabel.text == "/" {
                
                if let firstNum = firstNumberTextField.text, let secondNum = secondNumberTextField.text {
                    let result = Float(firstNum)! / Float(secondNum)!
                    resultLabel.text = String(describing: result)
                }
                
            }//<!-- end of divide -->
            
//////<!!-- END OF UNCOMMENT THIS AREA FOR PREVIOUS RESULT --> ////////////////////////
            
            
        }//<!-- end of if ready for calculation-->
    }//<!-- end handle compute-->
    
    @objc func handleOperatorLabel (sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            //print("None")
            operatorLabel.text = ""
        case 1:
            //print("Add")
            operatorLabel.text = "+"
        case 2:
            //print("Subtract")
            operatorLabel.text = "-"
        case 3:
            //print("Multiply")
            operatorLabel.text = "*"
        case 4:
            //print("Divide")
            operatorLabel.text = "/"
        default:
            break

        }
    }//<!-- end of handleOperatorLabel-->
    
    func setupScreen () {
        //segmentedControl
        
        let segmentedControl = UISegmentedControl(items: operators)
        
        
        segmentedControl.addTarget(self, action: #selector(handleOperatorLabel), for: .valueChanged)
        
        //remove frame
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        //add to view
        view.addSubview(segmentedControl)
        
        
        view.addSubview(firstNumberTextField)
        
        //constraints
        
        firstNumberTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        firstNumberTextField.topAnchor.constraint(equalTo: view.topAnchor, constant: 64).isActive = true
        firstNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        firstNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //segmentedControl constraints
        
        segmentedControl.leftAnchor.constraint(equalTo: firstNumberTextField.leftAnchor, constant: 0).isActive = true
        segmentedControl.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        segmentedControl.topAnchor.constraint(equalTo: firstNumberTextField.bottomAnchor, constant: 20).isActive = true
        segmentedControl.heightAnchor.constraint(equalToConstant: 40).isActive = true
        
        //select first item in segmentedControl by default
        segmentedControl.selectedSegmentIndex = 0
        
        //<!-- Operator Label-->
        
        view.addSubview(operatorLabel)
        
        //constraints
        
        operatorLabel.leftAnchor.constraint(equalTo: firstNumberTextField.rightAnchor, constant: 10).isActive = true
        operatorLabel.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        operatorLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        operatorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        //<!-- Second number -->
        view.addSubview(secondNumberTextField)
        
        //constraints
        
        secondNumberTextField.leftAnchor.constraint(equalTo: operatorLabel.rightAnchor, constant: 10).isActive = true
        secondNumberTextField.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        secondNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        secondNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        //<!-- Result label -->
        
        view.addSubview(resultLabel)
        
        //constraints
        
        resultLabel.leftAnchor.constraint(equalTo: secondNumberTextField.rightAnchor, constant: 8).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        resultLabel.rightAnchor.constraint(equalTo: segmentedControl.rightAnchor, constant: 0).isActive = true
        //resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //compute button
        view.addSubview(computeButton)
        
        //constraints
        
        computeButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 8).isActive = true
        computeButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -8).isActive = true
        computeButton.topAnchor.constraint(equalTo: segmentedControl.bottomAnchor, constant: 20).isActive = true
        
        computeButton.addTarget(self, action: #selector(handleCompute), for: .touchUpInside)
    }

}

