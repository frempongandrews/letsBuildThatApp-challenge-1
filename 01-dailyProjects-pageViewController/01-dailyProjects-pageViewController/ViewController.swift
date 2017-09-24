//
//  ViewController.swift
//  01-dailyProjects-pageViewController
//
//  Created by Andrews Frempong on 22/09/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var text: String = "Page 1"
    var contentTitle: String = ""
    var contentBody: String = ""
    var pageImageName: String = ""
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .black
        
        setupUI()
        
        
        //Device orientation
        NotificationCenter.default.addObserver(self, selector: #selector(self.deviceRotated), name: NSNotification.Name.UIDeviceOrientationDidChange, object: nil)
        
      
        
    }
    
    //Device orientation
    func deviceRotated () {
        print("rotation changed")
    }
    
    
    
    func setupUI () {
        
        ///////////=> page number
        
        let pageNumberLabel: UILabel = {
            
            let label = UILabel()
            label.text = text
            label.textColor = .white
            label.textAlignment = .center
            label.layer.borderColor = UIColor.white.cgColor
            label.layer.borderWidth = 1
            //button.backgroundColor = .white
            
            
            //deactivating frame layout
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
            
        }()
        
        //adding label to view
        view.addSubview(pageNumberLabel)
        
        //positioning label
        pageNumberLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        pageNumberLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100).isActive = true
        pageNumberLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
        pageNumberLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
   
  
        
        ///////////=>creating content container: for image and text
        
        let contentContainer: UIView = {
            let cv = UIView()
            cv.backgroundColor = .white
            cv.layer.borderWidth = 1
            cv.layer.borderColor = UIColor.red.cgColor
            
            //deactivate frame layout
            cv.translatesAutoresizingMaskIntoConstraints = false
            return cv
        }()
        
        view.addSubview(contentContainer)
        
        //constraints
        
        contentContainer.leftAnchor.constraint(equalTo: view.leftAnchor, constant: view.frame.width * 0.05).isActive = true
        contentContainer.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -(view.frame.width * 0.05)).isActive = true
        contentContainer.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -(view.frame.height * 0.15)).isActive = true
        contentContainer.heightAnchor.constraint(equalToConstant: view.frame.height - (view.frame.height * 0.2)).isActive = true
        
        
        ///////////=>creating image
        
        let pageImage: UIImageView = {
            let iv = UIImageView()
            iv.image = UIImage(named: self.pageImageName)
            //iv.backgroundColor = .red
            iv.contentMode = .scaleAspectFit
            //deactivating frame layout
            iv.translatesAutoresizingMaskIntoConstraints = false
            
            return iv
        }()
        
        
        
        //show it in contentContainer
        
        contentContainer.addSubview(pageImage)
        
        
        
        //adding constraints
        
        
        pageImage.leftAnchor.constraint(equalTo: contentContainer.leftAnchor, constant: 0).isActive = true
        pageImage.topAnchor.constraint(equalTo: contentContainer.topAnchor, constant: 20).isActive = true
        pageImage.rightAnchor.constraint(equalTo: contentContainer.rightAnchor, constant: 0).isActive = true
        pageImage.heightAnchor.constraint(equalToConstant: 200).isActive = true
        
        ///////////=>content title
        
        let contentTitleLabel: UILabel = {
            
            let label = UILabel()
            label.text = contentTitle
            label.textColor = .black
            label.font = .boldSystemFont(ofSize: 16)
            
            label.textAlignment = .center
            label.layer.borderColor = UIColor.red.cgColor
            label.layer.borderWidth = 1
            //button.backgroundColor = .white
            
            
            //deactivating frame layout
            label.translatesAutoresizingMaskIntoConstraints = false
            
            return label
            
        }()
        
        contentContainer.addSubview(contentTitleLabel)
        
        //constraints
        
        contentTitleLabel.leftAnchor.constraint(equalTo: contentContainer.leftAnchor, constant: 20).isActive = true
        contentTitleLabel.rightAnchor.constraint(equalTo: contentContainer.rightAnchor, constant: -20).isActive = true
        contentTitleLabel.topAnchor.constraint(equalTo: pageImage.bottomAnchor, constant: 40).isActive = true
        contentTitleLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        
        
        
        ///////////=>content body
        
        let contentBodyLabel: UILabel = {
            
            let label = UILabel()
            label.text = contentBody
            label.textColor = .black
            label.font = UIFont(name: "Arial", size: 12)
            
            label.textAlignment = .center
            label.layer.borderColor = UIColor.red.cgColor
            label.layer.borderWidth = 1
            label.lineBreakMode = .byWordWrapping
            label.numberOfLines = 3
            
            
            //deactivating frame layout
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
            
        }()
        
        contentContainer.addSubview(contentBodyLabel)
        
        
        //constraints
        
        contentBodyLabel.leftAnchor.constraint(equalTo: contentContainer.leftAnchor, constant: 50).isActive = true
        contentBodyLabel.rightAnchor.constraint(equalTo: contentContainer.rightAnchor, constant: -50).isActive = true
        contentBodyLabel.topAnchor.constraint(equalTo: contentTitleLabel.bottomAnchor, constant: 20).isActive = true
        contentBodyLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        
      
        
        ///////////=>Prev button
        
        
        
    }
    

}

