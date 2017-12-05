//
//  RootPageViewController.swift
//  iFinance
//
//  Created by Brandon Antezana on 11/18/17.
//  Copyright © 2017 Brandon Antezana. All rights reserved.
//

import UIKit
import Foundation
class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {

    
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
        
        let vc1 = sb.instantiateViewController(withIdentifier: "orangeVC")
        let vc2 = sb.instantiateViewController(withIdentifier: "yellowVC")
        let vc3 = sb.instantiateViewController(withIdentifier: "purpleVC")
        
        return [vc1, vc2, vc3]
    }()
    
    var valueX: String = ""
    var valueY: String = ""
    var total: String = ""
    @IBAction func userInput_1 (sender : UITextField){
        sender.text = valueX
    }
    
    @IBAction func userInput_2 (sender: UITextField){
        sender.text = valueY
        total = valueX + valueY
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
