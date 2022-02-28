//
//  WelcomeViewController.swift
//  Monchify
//
//  Created by DJ perrier  on 10/2/22.
//

import UIKit

class WelcomeViewController: UIViewController {
    
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white 
        button.setTitle("Sign In With Monchify", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()
    
    private let imageView: UIImageView = {//new
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "albums_background")
        return imageView
    }()
    
    private let overlayView: UIView = {//new
        let view = UIView()
        view.backgroundColor = .systemBrown
        view.alpha = 0.7
        return view
    }()
    
    private let logoImageView: UIImageView = {//new
       let imageView = UIImageView(image: UIImage(named: ""))
       imageView.contentMode = .scaleAspectFit
        return imageView
    }()
   
    private let label: UILabel = {//new
        let label = UILabel()
        label.numberOfLines = 0
        label.textAlignment = .left
        label.textColor = .white
        label.font = .systemFont(ofSize: 32, weight: .semibold)
        label.text = "Listen to Millions\nof Songs on\nthe go."
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Monchify"
        view.addSubview(imageView)
        view.addSubview(overlayView)
        view.backgroundColor = .systemBrown
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
        view.addSubview(label)
        view.addSubview(logoImageView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = view.bounds //new
        overlayView.frame = view.bounds //new
        signInButton.frame = CGRect(
            x: 20,
            y: view.height-50-view.safeAreaInsets.bottom,
            width: view.width-40,
            height: 50
        )
        
        logoImageView.frame = CGRect(x: (view.width-120)/2, y: (view.height-350)/2, width: 120, height: 120)//new
        label.frame = CGRect(x: 30, y: logoImageView.bottom+30, width: view.width-60, height: 150)//new
    }
  
    @objc func didTapSignIn(){
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    
    private func handleSignIn(success: Bool){
        //Log user in or yell at them for error
        guard success else {
            let alert = UIAlertController(title: "Oops",
                                          message: "Something went wrong when signing in.",
                                          preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
            present(alert, animated: true)
            return
        }
        
        let mainAppTabBarVC = TabBarViewController()
        mainAppTabBarVC.modalPresentationStyle = .fullScreen
        present(mainAppTabBarVC, animated: true)
    }

}
