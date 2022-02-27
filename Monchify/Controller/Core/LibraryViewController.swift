//
//  LibraryViewController.swift
//  Monchify
//
//  Created by DJ perrier  on 10/2/22.
//

import UIKit

class LibraryViewController: UIViewController {
    
    private let playlistsVC = LibraryPlaylistsViewController()
    private let albumsVC = LibraryAlbumsViewController()
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isPagingEnabled = true
        return scrollView
    }()

    
    private let toggleView = LibraryToggleView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        view.addSubview(toggleView) //set up toggleView
        toggleView.delegate = self 
       
        view.addSubview(scrollView)
        scrollView.contentSize = CGSize(width: view.width+2, height: scrollView.height) //swipe between pink to yellow( LibraryPlaylistsViewController)
        scrollView.delegate = self
        
        addChildren()
        updateBarButtons()//new
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(
            x: 0,
            y: view.safeAreaInsets.top+50,
            width: view.width,
            height: view.height-view.safeAreaInsets.top-view.safeAreaInsets.bottom-55
        )
        toggleView.frame = CGRect(//show up setting from Library Toggle View
            x: 0,
            y: view.safeAreaInsets.top,
            width: 200,
            height: 55
        )
    }
    
    private func updateBarButtons() {//new
        switch toggleView.state {
        case .playlist:
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        case .album:
            navigationItem.rightBarButtonItem = nil
        }
        
    }
    
    @objc private func didTapAdd () {
        playlistsVC.showCreatePlaylistAlret()//new from APICaller
    }
    
    private func addChildren() {
        addChild(playlistsVC)
        scrollView.addSubview(playlistsVC.view)
        playlistsVC.view.frame = CGRect(x: 0, y: 0, width: scrollView.width, height: scrollView.height)
        playlistsVC.didMove(toParent: self)
        
        addChild(albumsVC)
        scrollView.addSubview(albumsVC.view)
        albumsVC.view.frame = CGRect(x: view.width, y: 0, width: scrollView.width, height: scrollView.height)// can view albumsViewController
        albumsVC.didMove(toParent: self)
    }

}

extension LibraryViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if scrollView.contentOffset.x >= (view.width-100) {
            toggleView.update(for: .album)
            updateBarButtons()//new
    }
    else {
           toggleView.update(for: .playlist)
           updateBarButtons()//new
       }
    }
 }

extension LibraryViewController: LibraryToggleViewDelegate {
    func libraryToggleViewDidTapPlaylists(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(.zero, animated: true)
        updateBarButtons()//new
        
    }
    
    
    func libraryToggleViewDidTapAlbums(_ toggleView: LibraryToggleView) {
        scrollView.setContentOffset(CGPoint(x: view.width, y: 0), animated: true)
        updateBarButtons()//new
    }
    
    
}
