

import UIKit

class RootPageViewController: UIPageViewController, UIPageViewControllerDataSource {
    
    
    @objc func back(sender: UIBarButtonItem) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    lazy var viewControllerList: [UIViewController] = {
        let sb = UIStoryboard(name: "Main", bundle: nil)
   
        let vc1 = sb.instantiateViewController(identifier: "1")
        let vc2 = sb.instantiateViewController(identifier: "2")
        let vc3 = sb.instantiateViewController(identifier: "3")
        let vc4 = sb.instantiateViewController(identifier: "4")
        let vc5 = sb.instantiateViewController(identifier: "5")
        let vc6 = sb.instantiateViewController(identifier: "6")
        return [vc1, vc2, vc3, vc4, vc5, vc6]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    
       
        dataSource = self
      
        if let firstViewController = viewControllerList.first {
            setViewControllers([firstViewController], direction: .forward, animated: true, completion: nil)
        }
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        let previousIndex = vcIndex - 1
        guard previousIndex >= 0 else { return nil }
        guard viewControllerList.count > previousIndex else { return nil }
        return viewControllerList[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let vcIndex = viewControllerList.index(of: viewController) else { return nil }
        let nextIndex = vcIndex + 1
        guard viewControllerList.count != nextIndex else { return nil }
        guard viewControllerList.count > nextIndex else { return nil }
        return viewControllerList[nextIndex]
    }

//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if (segue.identifier == "PageVCToDetail") {
//            let DetailViewController = segue.destination as? DetailViewController
//        }
//    }
//    override func viewWillDisappear(_ animated: Bool) {
//        super.viewWillDisappear(animated)
//
//        if self.isMovingFromParent {
//            //code goes here
//            self.navigationController?.popToRootViewController(animated: false)
//        }
//    }

//    override func viewWillAppear(_ animated: Bool) {
//        navigationController?.setNavigationBarHidden(false, animated: true)
//        navigationController?.hidesBarsOnTap = true
//        navigationItem.hidesBackButton = true
//        let newBackButton = UIBarButtonItem(title: "Go Back", style: UIBarButtonItem.Style.bordered, target: self, action: #selector(back))
//        navigationItem.leftBarButtonItem = newBackButton
//    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.hidesBarsOnTap = true
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Go Back", style: UIBarButtonItem.Style.bordered, target: self, action: #selector(back))
        navigationItem.leftBarButtonItem = newBackButton
    }
}
