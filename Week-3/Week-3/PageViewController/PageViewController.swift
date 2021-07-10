
//MARK: PageControl ekleyerek bir onboarding ekranı yapınız..

import UIKit

class PageViewController: UIViewController {

    var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red
        controllers.append(vc1)
        
        let vc2 = UIViewController()
        vc2.view.backgroundColor = .gray
        controllers.append(vc2)
        
        let vc3 = UIViewController()
        vc3.view.backgroundColor = .green
        controllers.append(vc3)
        
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .blue
        controllers.append(vc4)
    
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.pageVC()
    }
    
    func pageVC() {
        guard let first = controllers.first else { return }
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.delegate = self
        vc.dataSource = self
        vc.setViewControllers([first], direction: .forward, animated: true, completion: nil)
        present(vc, animated: true, completion: nil)
    }

}

extension PageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController), index > 0 else { return nil }
        
        let prev = index - 1
        
        return controllers[prev]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let index = controllers.firstIndex(of: viewController), index < (controllers.count - 1) else { return nil }
        
        let next = index + 1
        
        return controllers[next]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let currenVC = controllers.first, let currentIndex = controllers.firstIndex(of: currenVC) else { return 0}
        return currentIndex
    }
}

//MARK: PageControl ekleyerek bir onboarding ekranı yapınız..
