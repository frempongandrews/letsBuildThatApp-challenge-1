//
//  ViewController.swift
//  02-dailyProjects-Calculator
//
//  Created by Andrews Frempong on 06/10/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.backgroundColor = .white
        setupLayout ()
    }
    
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
        
        containerView.addSubview(firstNumberTextField)
        
        //constraints
        
        firstNumberTextField.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 10).isActive = true
        firstNumberTextField.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 10).isActive = true
        firstNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        firstNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        //<!-- Operator Label-->
        
        
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
        
        containerView.addSubview(operatorLabel)
        
        //constraints
        
        operatorLabel.leftAnchor.constraint(equalTo: firstNumberTextField.rightAnchor, constant: 10).isActive = true
        operatorLabel.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        operatorLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.10).isActive = true
        operatorLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
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
        
        containerView.addSubview(secondNumberTextField)
        
        //constraints
        
        secondNumberTextField.leftAnchor.constraint(equalTo: operatorLabel.rightAnchor, constant: 10).isActive = true
        secondNumberTextField.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        secondNumberTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        secondNumberTextField.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
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
        
        containerView.addSubview(resultLabel)
        
        //constraints
        
        resultLabel.leftAnchor.constraint(equalTo: secondNumberTextField.rightAnchor, constant: 8).isActive = true
        resultLabel.centerYAnchor.constraint(equalTo: firstNumberTextField.centerYAnchor, constant: 0).isActive = true
        resultLabel.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.25).isActive = true
        resultLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true

        
        
        
        //<!-- Operators container-->
        

        let operatorsContainerView: UIView = {
            let v = UIView()
            v.backgroundColor = .green
            v.layer.borderColor = UIColor.red.cgColor
            v.layer.borderWidth = 1
            
            v.translatesAutoresizingMaskIntoConstraints = false
            return v
        }()
        
        //add container to screen
        
        containerView.addSubview(operatorsContainerView)
        
        //constraints
        
        operatorsContainerView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 5).isActive = true
        operatorsContainerView.topAnchor.constraint(equalTo: firstNumberTextField.bottomAnchor, constant: 15).isActive = true
        operatorsContainerView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -5).isActive = true
        operatorsContainerView.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
        
        //<!-- Creating 4 buttons with for loop-->
        
        var buttonsArr: [UIButton] = []
        var buttonTitles = ["None", "Add", "Subtract", "Multiply", "Divide", "Compute"]
        var leftAnchor:NSLayoutXAxisAnchor?
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
                //add to view
                
                containerView.addSubview(button)
                
                //constraints
                
                button.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 8).isActive = true
                button.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -8).isActive = true
                button.topAnchor.constraint(equalTo: operatorsContainerView.bottomAnchor, constant: 10).isActive = true
                
                print(buttonTitles[i])
            }
            
            
            
            
            
            
            
            
            
        } //<!-- End Creating 4 buttons with for loop-->

        
        
        
     
        
        
        
    }//<!-- End of setupLayout -->
        
        
        
    
    
    
    



}

