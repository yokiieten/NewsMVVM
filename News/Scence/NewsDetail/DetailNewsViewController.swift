//
//  DetailNewsViewController.swift
//  News
//
//  Created by Sahassawat on 21/1/2566 BE.
//

import UIKit
import RxSwift

class DetailNewsViewController: UIViewController {
    
    var detailNewsViewModel = DetailNewsViewModel()
    @IBOutlet weak var newsImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var contentLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupBackgroundView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setupView()
    }
    
    private func setupBackgroundView() {
        let image = UIImage(named: "bgdetail")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.contentMode = .scaleToFill
        self.view.insertSubview(imageView, at: 0)
    }
    
    private func setupView() {
        detailNewsViewModel.article?.title.asDriver(onErrorJustReturn: "")
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        detailNewsViewModel.article?.content.asDriver(onErrorJustReturn: "")
            .drive(contentLabel.rx.text)
            .disposed(by: disposeBag)
        
        detailNewsViewModel.article?.description.asDriver(onErrorJustReturn: "")
            .drive(descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        detailNewsViewModel.article?.publishedAt.asDriver(onErrorJustReturn: "")
            .drive(dateLabel.rx.text)
            .disposed(by: disposeBag)
        
        detailNewsViewModel.article?.urlToImage.subscribe(onNext: { urlToImage in
            if urlToImage.isEmpty {
                self.newsImage.image = UIImage(named:"nodata")
            } else {
                let imagePath: String = urlToImage
                let imageUrl = URL(string: imagePath)
                
                self.newsImage?.setImage(with: imageUrl)
            }
        }).disposed(by: disposeBag)
        
        detailNewsViewModel.article?.source.asDriver(onErrorJustReturn: "")
            .drive(sourceLabel.rx.text)
            .disposed(by: disposeBag)
        
        setupAnimation()
    }
    
    private func setupAnimation() {
        newsImage.center.x = view.center.x
        newsImage.center.x -= view.bounds.width
        titleLabel.center.x = view.center.x
        titleLabel.center.x -= view.bounds.width
        descriptionLabel.center.x = view.center.x
        descriptionLabel.center.x -= view.bounds.width
        contentLabel.center.x = view.center.x
        contentLabel.center.x -= view.bounds.width
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseOut], animations: {
            self.newsImage.center.x += self.view.bounds.width
            self.titleLabel.center.x += self.view.bounds.width
            self.descriptionLabel.center.x += self.view.bounds.width
            self.contentLabel.center.x += self.view.bounds.width
                  self.view.layoutIfNeeded()
            }, completion: nil)
    }
    
}
