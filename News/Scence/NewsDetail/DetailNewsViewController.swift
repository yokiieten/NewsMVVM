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
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    private func setupView() {
        detailNewsViewModel.article?.title.asDriver(onErrorJustReturn: "")
            .drive(titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        detailNewsViewModel.article?.content.asDriver(onErrorJustReturn: "")
            .drive(contentLabel.rx.text)
            .disposed(by: disposeBag)
        
        detailNewsViewModel.article?.publishedAt.asDriver(onErrorJustReturn: "")
            .drive(dateLabel.rx.text)
            .disposed(by: disposeBag)
        
        detailNewsViewModel.article?.urlToImage.subscribe(onNext: { urlToImage in
            let imagePath: String = urlToImage
            let imageUrl = URL(string: imagePath)
            self.newsImage?.setImage(with: imageUrl)
        }).disposed(by: disposeBag)
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
