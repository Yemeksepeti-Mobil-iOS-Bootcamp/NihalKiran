//MARK: - PageControl ekleyerek bir onboarding ekranı yapınız..

import UIKit

class PageViewController: UIViewController {
    
    private let scrollView = UIScrollView()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.backgroundColor = .systemBlue
        return pageControl
    }()

    // var controllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        scrollView.backgroundColor = .red
        view.addSubview(scrollView)
        view.addSubview(pageControl)

        // Do any additional setup after loading the view.
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10, y: view.frame.size.height - 100, width: view.frame.size.width - 20, height: 70)
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [.systemRed, .systemGray, .systemGreen, .systemOrange, .systemPurple]
        for i in 0..<pageControl.numberOfPages {
            let page = UIView(frame: CGRect(x: CGFloat(i) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            page.backgroundColor = colors[i]
            scrollView.addSubview(page)
        }
    }
}


extension PageViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x)) / Float(scrollView.frame.size.width))
    }
}

