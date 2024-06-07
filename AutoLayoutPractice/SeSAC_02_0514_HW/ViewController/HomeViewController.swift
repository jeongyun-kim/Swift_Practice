//
//  HomeViewController.swift
//  SeSAC_02_0514_HW
//
//  Created by 김정윤 on 5/16/24.
//

import UIKit

class HomeViewController: UIViewController {
    @IBOutlet var playView: UIView!
    @IBOutlet var playImageView: UIImageView!
    @IBOutlet var playBtn: UIButton!
    @IBOutlet var zzimBtn: UIButton!
    
    @IBOutlet var nowHotLabel: UILabel!
    
    @IBOutlet var thumnailsImageView: [UIImageView]!
    @IBOutlet var nowHotContentsThumnailsStackView: UIStackView!
    
    let movies = Movie.movies
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getRandomThumbnailImage()
    }
    
    func setupUI() {
        navigationItem.title = "홈"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        self.view.backgroundColor = .black
        
        playImageView.image = UIImage(named: "play_normal")
        playView.backgroundColor = .white
        playView.layer.cornerRadius = 6
        playBtn.setTitle("", for: .normal)
        playBtn.layer.cornerRadius = 6
        zzimBtn.setAttributedTitle(NSAttributedString(string: "내가 찜한 리스트", attributes: [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)]), for: .normal)
        zzimBtn.setImage(UIImage(systemName: "plus"), for: .normal)
        zzimBtn.configuration?.imagePadding = 3
        zzimBtn.backgroundColor = .darkGray
        zzimBtn.tintColor = .white
        zzimBtn.layer.cornerRadius = 6
        
        nowHotLabel.text = "지금 뜨는 콘텐츠"
        nowHotLabel.textColor = .white
        nowHotLabel.font = UIFont.systemFont(ofSize: 18)
        
        nowHotContentsThumnailsStackView.spacing = 8
        nowHotContentsThumnailsStackView.distribution = .fillEqually
        for i in (0..<4) {
            setupTumbnailImageView(imageView: thumnailsImageView[i])
        }
    }
    
    func setupTumbnailImageView(imageView: UIImageView) {
        imageView.layer.cornerRadius = 7
        imageView.contentMode = .scaleAspectFill
    }
    
    func getRandomThumbnailImage() {
        var randomMovies: [String] = []
        while (randomMovies.count < 4) {
            let randomMovie = movies.randomElement()!.title
            if !randomMovies.contains(randomMovie) {
                randomMovies.append(randomMovie)
            }
        }
        for i in (0..<4) {
            thumnailsImageView[i].image = UIImage(named: randomMovies[i])
        }
    }

    @IBAction func playBtnTapped(_ sender: UIButton) {
        getRandomThumbnailImage()
    }
}
