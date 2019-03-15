//
//  pageViewController.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 09/03/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit

class pageViewController: UIPageViewController {
    
    //Create an array of certificate items
    var arrayOfCerts = [CertItem]()
    var currentIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = self
        loadData()
        
        //create a view controller by calling the certController function below by passing in the index (which is 0 to start)
        if let viewController = certController(currentIndex ?? 0) {
            //create an array of these controllers
            let arrayOfViewControllers = [viewController]
            //call function setViewControllers, passing in the array of view controllers
            setViewControllers(arrayOfViewControllers,
                               direction: .forward,
                               animated: false,
                               completion: nil)
        }
    }
    
    //this function creates a view controller by calling the instantiateViewController function in the storyboard class, looking for the view controller in it with the right identifier and casting it to the right class.
    func certController(_ index: Int) -> certImageViewController? {
        if let storyboard = storyboard,
            let page = storyboard.instantiateViewController(withIdentifier: "certImageViewController") as? certImageViewController {
            //pass to the storyboard item the item in the array of certs at the right index one-by-one
            page.certItem = arrayOfCerts[index]
            page.certIndex = index
            return page
        }
        return nil
    }

    
    func loadData(){
        arrayOfCerts.append(CertItem(title: "Certificate of Medical Device", image: UIImage(named:"MedicalDeviceCert")!))
        arrayOfCerts.append(CertItem(title: "DNV Certificate", image: UIImage(named:"DNV")!))
        arrayOfCerts.append(CertItem(title: "FDA Registration Number", image: UIImage(named:"FDA")!))
        arrayOfCerts.append(CertItem(title: "ISO9001 Certificate", image: UIImage(named:"iso")!))
        arrayOfCerts.append(CertItem(title: "WQA Gold Seal Certificate", image: UIImage(named:"WQA")!))
        arrayOfCerts.append(CertItem(title: "Patented 8 Point System", image: UIImage(named:"patent")!))
        arrayOfCerts.append(CertItem(title: "JAPA Certificate", image: UIImage(named:"JAPA Enagic")!))
        arrayOfCerts.append(CertItem(title: "TUV ISO 13485", image: UIImage(named: "ISO13485")!))
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

//MARK: implementation of UIPageViewControllerDataSource
extension pageViewController: UIPageViewControllerDataSource {
    //to create the view controller before the current if you're going back, cast a view controller passed in as the right type, minus the index and return the controller you find there.
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        if let viewController = viewController as? certImageViewController {
            //get the index assigned to the current view controller, subtract 1 from in and return the one at the new index.
            var index = viewController.certIndex
            guard index != NSNotFound && index != 0 else { return nil }
            index = index! - 1
            return certController(index!)
        }
        return nil
    }
    
    // 2
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        if let viewController = viewController as? certImageViewController {
            var index = viewController.certIndex
            guard index != NSNotFound else { return nil }
            index = index! + 1
            guard index != arrayOfCerts.count else {return nil}
            return certController(index!)
        }
        return nil
    }
    
    // MARK: UIPageControl
    //tell the delegate how many pages
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        // 1
        return arrayOfCerts.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        // 2
        return currentIndex ?? 0
    }
}
