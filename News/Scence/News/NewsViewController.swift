//
//  NewsViewController.swift
//  News
//
//  Created by Sahassawat on 20/1/2566 BE.
//

import UIKit
import RxSwift

class NewsViewController: UIViewController {
    
    @IBOutlet weak var loadingView: UIView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let disposeBag = DisposeBag()
    var articleListVM: ArticleListViewModel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        showSpinner()
        setupTableView()
        callAPINews()
        setupBackgroundView()
    }
    
    private func setupBackgroundView() {
        let image = UIImage(named: "bg")
        let imageView = UIImageView(image: image!)
        imageView.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        imageView.contentMode = .scaleToFill
        self.view.insertSubview(imageView, at: 0)
    }
    
    private func setupTableView() {
        tableView.registerCells(classNames: [NewsCell.reuseIdentifer])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func callAPINews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(API.apiKey)")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                let articles = articleResponse.articles
                self.articleListVM = ArticleListViewModel(articles)
                DispatchQueue.main.async {
                    self.hideSpinner()
                    self.tableView.reloadData()
                }
            }).disposed(by: disposeBag)
    }
    
    private func pushViewController(index: Int) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let detailNewsVC = storyboard.instantiateViewController(withIdentifier: "DetailNewsViewController") as! DetailNewsViewController
        detailNewsVC.detailNewsViewModel.article = articleListVM.articleAt(index)
        navigationController?.pushViewController(detailNewsVC, animated: true)
    }
    
    private func showSpinner() {
        activityIndicator.startAnimating()
        loadingView.isHidden = false
    }

    private func hideSpinner() {
        activityIndicator.stopAnimating()
        loadingView.isHidden = true
    }
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0: self.articleListVM.filterArticlesVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            fatalError("NewsCell is not found")
        }
        
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.titleLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.publishedAt.asDriver(onErrorJustReturn: "")
            .drive(cell.timeLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.urlToImage.subscribe(onNext: { urlToImage in
            if urlToImage.isEmpty {
                cell.newsImage.image = UIImage(named:"nodata")
            } else {
                let imagePath: String = urlToImage
                let imageUrl = URL(string: imagePath)
                
                cell.newsImage?.setImage(with: imageUrl)
            }
        }).disposed(by: disposeBag)
        
        articleVM.source.asDriver(onErrorJustReturn: "")
            .drive(cell.sourceLabel.rx.text)
            .disposed(by: disposeBag)
        
        cell.animation()
        
        return cell
    }
    
}

extension NewsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        pushViewController(index: indexPath.row)
    }
}

extension NewsViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchText.isEmpty {
            self.articleListVM.filterArticlesVM = articleListVM.articlesVM
        } else {
            var titleSearch: String = ""
            self.articleListVM.filterArticlesVM = self.articleListVM.articlesVM.filter { news in
                news.title.subscribe { title in
                    titleSearch = title
                }.disposed(by: disposeBag)
                return titleSearch.contains(searchText)
            }
        }
        tableView.reloadData()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
}
