//
//  OnboardingViewModel.swift
//  Phincon_MiniProject
//
//  Created by Farendza Muda on 02/06/23.
//

import UIKit

class OnboardingViewModel: UIPageViewController {
    
    var pages = [UIViewController]()
    
    let skipButton = UIButton()
    let nextButton = UIButton()
    let loginButton = UIButton()
    let signupButton = UIButton()
    let pageControl = UIPageControl()
    let initialPage = 0
    
    var pageControlBottomAnchor: NSLayoutConstraint?
    var skipButtonTopAnchor: NSLayoutConstraint?
    var nextButtonTopAnchor: NSLayoutConstraint?
    var loginButtonBottomAnchor: NSLayoutConstraint?
    var signupButtonBottomAnchor: NSLayoutConstraint?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
        self.view.backgroundColor = .systemGray6
    }
}

extension OnboardingViewModel {
    
    func setup(){
        dataSource = self
        delegate = self
        
        pageControl.addTarget(self, action: #selector(pageControlTapped(_:)), for: .valueChanged)
        
        let page1 = OnboardingView(imageName: "Onboarding1", titleText: "DIGITAL ABSENSI", subtitleText: "Kehadiran sistem absensi digital merupakan penemuan yang mampu menggantikan pencatatan data kehadiran secara manual")
        let page2 = OnboardingView(imageName: "Onboarding2", titleText: "ATTENDANCE SYSTEM", subtitleText: "Pengelolaan karyawan di era digital yang baik, menghasilkan karyawan terbaik pula, salah satunya absensi karyawan")
        let page3 = OnboardingView(imageName: "mask1", titleText: "SELALU PAKAI MASKER", subtitleText: "Guna mencegah penyebaran virus Covid-19, Pemerintah telah mengeluarkan kebijakan Physical Distancing serta kebijakan bekerja, belajar, dan beribadah dari rumah.")
        
        pages.append(page1)
        pages.append(page2)
        pages.append(page3)
        
        setViewControllers([pages[initialPage]], direction: .forward, animated: true, completion: nil)
    }
    
    func style(){
        pageControl.translatesAutoresizingMaskIntoConstraints = false
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray2
        pageControl.numberOfPages = pages.count
        pageControl.currentPage = initialPage
        
        skipButton.translatesAutoresizingMaskIntoConstraints = false
        skipButton.setTitleColor(.systemBlue, for: .normal)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.addTarget(self, action: #selector(skipTapped(_:)), for: .primaryActionTriggered)
        
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.setTitleColor(.systemBlue, for: .normal)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextTapped(_:)), for: .primaryActionTriggered)
        
    }
    
    func layout(){
        view.addSubview(pageControl)
        view.addSubview(skipButton)
        view.addSubview(nextButton)
        
        NSLayoutConstraint.activate([
            pageControl.widthAnchor.constraint(equalTo: view.widthAnchor),
            pageControl.heightAnchor.constraint(equalToConstant: 20),
            pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            skipButton.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 2),
            
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: nextButton.trailingAnchor, multiplier: 2)
        ])
        
        pageControlBottomAnchor = view.bottomAnchor.constraint(equalToSystemSpacingBelow: pageControl.bottomAnchor, multiplier: 2)
        skipButtonTopAnchor = skipButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        nextButtonTopAnchor = nextButton.topAnchor.constraint(equalToSystemSpacingBelow: view.safeAreaLayoutGuide.topAnchor, multiplier: 2)
        
        pageControlBottomAnchor?.isActive = true
        skipButtonTopAnchor?.isActive = true
        nextButtonTopAnchor?.isActive = true
        
    }
}

extension OnboardingViewModel:UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        
        if currentIndex == 0 {
            return pages.last
        } else {
            return pages[currentIndex - 1]
        }
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        
        guard let currentIndex = pages.firstIndex(of: viewController) else {return nil}
        
        if currentIndex < pages.count - 1 {
            return pages[currentIndex + 1]
        } else {
            return pages.first
        }
    }
}

extension OnboardingViewModel: UIPageViewControllerDelegate {
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        guard let viewControllers = pageViewController.viewControllers else {return}
        guard let currentIndex = pages.firstIndex(of: viewControllers[0]) else {return}
        
        pageControl.currentPage = currentIndex
        animateControlIsIfNeeded()
    }
    
    private func animateControlIsIfNeeded(){
        let lastPage = pageControl.currentPage == pages.count - 1
        
//        if lastPage {
//            hideControls()
//        } else {
//            showControls()
//        }
        
        UIViewPropertyAnimator.runningPropertyAnimator(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    
//    private func hideControls() {
//        pageControlBottomAnchor?.constant = -80
//        skipButtonTopAnchor?.constant = -80
//        nextButtonTopAnchor?.constant = -80
//    }
//
//    private func showControls(){
//        pageControlBottomAnchor?.constant = 16
//        skipButtonTopAnchor?.constant = 16
//        nextButtonTopAnchor?.constant = 16
//    }
}

extension OnboardingViewModel {
    
    @objc func pageControlTapped(_ sender: UIPageControl) {
        setViewControllers([pages[sender.currentPage]], direction: .forward, animated: true, completion: nil)
        animateControlIsIfNeeded()
    }
    
    @objc func skipTapped(_ sender: UIButton){
        let vc = LoginViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        
    }
    
    @objc func nextTapped(_ sender:UIButton){
        pageControl.currentPage += 1
        
        goToNextPage()
        animateControlIsIfNeeded()
    }
}

extension UIPageViewController {
    
    func goToNextPage(animated: Bool=true, completion:((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else {return}
        guard let nextPage = dataSource?.pageViewController(self, viewControllerAfter: currentPage) else { return}
        
        setViewControllers([nextPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToPreviousPage(animated: Bool = true, completion: ((Bool) -> Void)? = nil) {
        guard let currentPage = viewControllers?[0] else {return}
        guard let prevPage = dataSource?.pageViewController(self, viewControllerBefore: currentPage) else {return}
        
        setViewControllers([prevPage], direction: .forward, animated: animated, completion: completion)
    }
    
    func goToSpecificPage(index: Int, ofViewCotrollers pages: [UIViewController]) {
        setViewControllers([pages[index]], direction: .forward, animated: true, completion: nil)
    }
}
