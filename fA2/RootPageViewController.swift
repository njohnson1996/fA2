//
//  RootPageViewController.swift
//  iFinance
//
//  Created by Brandon Antezana on 11/18/17.
//  Copyright © 2017 Brandon Antezana. All rights reserved.
//

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {

    
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "purpleVC")
        let vc2 = sb.instantiateViewController(withIdentifier: "yellowVC")
        let vc3 = sb.instantiateViewController(withIdentifier: "orangeVC")
        
        return [vc1, vc2, vc3]
    }()
    
    var valueX = Int()
    var valueY = Int()
    @IBAction func userText1(_ sender: Any) {
        return 
        
    }
    
    
    @IBAction func userText2(_ sender: Any) {
        return
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.dataSource = self
        
        if let firstViewController = viewControllerList.first{
            self.setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }

        // Do any additional setup after loading the view.
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let Index = viewControllerList.index(of: viewController) else {return nil}
        
        let nextIndex = Index + 1
        
        guard viewControllerList.count != nextIndex else {return nil}
        
        guard viewControllerList.count > nextIndex else {return nil}
        
        return viewControllerList[nextIndex]
    }
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
       
        guard let vcIndex = viewControllerList.index(of: viewController) else{return nil}
        let previousIndex = vcIndex - 1
        
        guard previousIndex >= 0 else{return nil}
        
        guard viewControllerList.count > previousIndex else {return nil}
        
        
        return viewControllerList[previousIndex]
    }
    
}
