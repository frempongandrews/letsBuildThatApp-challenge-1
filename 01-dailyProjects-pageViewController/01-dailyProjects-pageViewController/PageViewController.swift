//
//  PageViewController.swift
//  01-dailyProjects-pageViewController
//
//  Created by Andrews Frempong on 22/09/2017.
//  Copyright © 2017 Andrews Frempong. All rights reserved.
//

import UIKit



class PageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
   
    
    var pages = [UIViewController]()
    let pageControl = UIPageControl()
    var NextButton: UIButton?
    let deepPink = UIColor.init(red: 255, green: 20/255, blue: 147/255, alpha: 1)
    var onLastPage = false
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        self.delegate = self
        let initialPage = 0
        
        //pages
        
        let page1 = ViewController()
        let page2 = ViewController()
        page1.pageImageName = "img"
        page1.contentTitle = "Join us today in our fun and games!"
        page1.contentBody = "Are you ready for loads and loads of fun? Don't wait any longer! We hope to see you in our stores soon"
        page1.view.backgroundColor = .white
        
        page2.text = "Page 2"
        let page3 = ViewController()
        page3.text = "Page 3"
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
        
        //page control
        
        pageControl.currentPageIndicatorTintColor = UIColor.init(red: 255, green: 20/255, blue: 147/255, alpha: 1)
        pageControl.pageIndicatorTintColor = .darkGray
        pageControl.currentPage = initialPage
        pageControl.numberOfPages = self.pages.count
        view.addSubview(self.pageControl)
        
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
        pageControl.widthAnchor.constraint(equalToConstant: 200).isActive = true
        pageControl.heightAnchor.constraint(equalToConstant: 20).isActive = true
        pageControl.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        
        pageControl.layer.borderColor = UIColor.red.cgColor
        pageControl.layer.borderWidth = 1
        
        
        ///////////=>Next button
        
        NextButton = {
            let button = UIButton()
            button.setTitle("NEXT", for: .normal)
            button.setTitleColor(deepPink, for: .normal)
            
            
            
//            button.backgroundColor = .blue
            
            //deactivate frame layout
            button.translatesAutoresizingMaskIntoConstraints = false
            
            return button
        }()
        
        //add to view
        
        if let unwrappedNextButton = NextButton {
            view.addSubview(unwrappedNextButton)
            
            //constraints
            
            unwrappedNextButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -10).isActive = true
            unwrappedNextButton.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -50 ).isActive = true
            unwrappedNextButton.heightAnchor.constraint(equalToConstant: 20).isActive = true
        }
    }
    
    //ASK: HOW DO I RUN ON OF THESE METHODS ON A BUTTON CLICK??
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        
        
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex < self.pages.count - 1 {
                //go to next page in array
                onLastPage = false
                print("going to next; onLastPage is: \(onLastPage)")
                NextButton?.setTitleColor(deepPink, for: .normal)
                return self.pages[viewControllerIndex + 1]
                
                
            }
            
            
            if viewControllerIndex == self.pages.count - 1 {
                onLastPage = true
                print(onLastPage)
                NextButton?.setTitleColor(UIColor.gray, for: .normal)
                return nil
            }
            
        }
        
        return nil
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        //print("going back")
        
        onLastPage = false
        print("Going back ; onLastPage = \(onLastPage)")
        NextButton?.setTitleColor(deepPink, for: .normal)
        
        if let viewControllerIndex = self.pages.index(of: viewController) {
            if viewControllerIndex == 0 {
                
                
                //TODO *******
                //*******previous button color to grey
                
                return nil
            } else {
                return pages[viewControllerIndex - 1]
            }
        }
        return nil
    }
    

    
    
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        if let viewControllers = pageViewController.viewControllers {
            if let viewControllerIndex = self.pages.index(of: viewControllers[0]) {
                self.pageControl.currentPage = viewControllerIndex
            }
        }
        
    }
    
}



