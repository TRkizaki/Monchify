//
//  PlayerViewController.swift
//  Monchify
//
//  Created by DJ perrier  on 10/2/22.
//

import UIKit
import SDWebImage

protocol PlayerViewControllerDelegate: AnyObject {
    func didTapPlayPause()
    func didTapForward()
    func didTapBackward()
    func didSlideSlider(_ value: Float) //new 
}

class PlayerViewController: UIViewController {
    
    weak var dataSource: PlayerDataSource?
    weak var delegate: PlayerViewControllerDelegate?

    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private let controlsView = PlayerControlsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        view.addSubview(imageView)
        view.addSubview(controlsView)
        controlsView.delegate = self //new
        configureBarButton()
        configure()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        imageView.frame = CGRect(x: 0, y: view.safeAreaInsets.top, width: view.width, height: view.width)
        controlsView.frame = CGRect(//new 
            x: 10,
            y: imageView.bottom+10,
            width: view.width-20,
            height: view.height-imageView.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom-15
        )
    }
    
    private func configure() {
        imageView.sd_setImage(with: dataSource?.imageURL, completed: nil )
        controlsView.configure(//new
            with: PlayerControlsViewViewModel (
               title: dataSource?.songName,
               subtitle: dataSource?.subtitle
           )
        )
        
    }
    
    private func configureBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .close, target: self, action: #selector(didTapClose))
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .action, target: self, action: #selector(didTapAction))
        
    }

    @objc private func didTapClose() {
        dismiss(animated: true, completion: nil)
    }
    
    @objc private func didTapAction() {
        //Actions
    }
    
    func refreshUI() {
        configure()
    }
}

extension PlayerViewController: PlayerControlsViewDelegate {
    
    func playerControlsViewDidTapPlayPauseButton(_ playerControlsView: PlayerControlsView) {
        delegate?.didTapPlayPause()
    }
    
    func playerControlsViewDidTapForwardButton(_ playerControlsView: PlayerControlsView) {
        delegate?.didTapForward()
    }
    
    func playerControlsViewDidTapBackwardsButton(_ playerControlsView: PlayerControlsView) {
        delegate?.didTapBackward()
    }
    func playerControlsView(_ playerControlsView: PlayerControlsView, didSlideSlider value: Float) {
    delegate?.didSlideSlider(value)
   }
}
