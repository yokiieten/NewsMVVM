//
//  NewsViewController.swift
//  News
//
//  Created by Sahassawat on 20/1/2566 BE.
//

import UIKit
import RxSwift

class NewsViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    var articleListVM: ArticleListViewModel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.navigationController?.navigationBar.prefersLargeTitles = true
        setupTableView()
        poppulateNews()
    }
    
    private func setupTableView() {
        tableView.registerCells(classNames: [NewsCell.reuseIdentifer])
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    private func poppulateNews() {
        let resource = Resource<ArticleResponse>(url: URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=6b20b05ef9e44a87804b0281c77a7f91")!)
        
        URLRequest.load(resource: resource)
            .subscribe(onNext: { articleResponse in
                let articles = articleResponse.articles
                self.articleListVM = ArticleListViewModel(articles)
                DispatchQueue.main.async {
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
    
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListVM == nil ? 0: self.articleListVM.articlesVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath) as? NewsCell else {
            fatalError("NewsCell is not found")
        }
        
        let articleVM = self.articleListVM.articleAt(indexPath.row)
        articleVM.title.asDriver(onErrorJustReturn: "")
            .drive(cell.headerLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.description.asDriver(onErrorJustReturn: "")
            .drive(cell.descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.publishedAt.asDriver(onErrorJustReturn: "")
            .drive(cell.time.rx.text)
            .disposed(by: disposeBag)
        
        articleVM.urlToImage.subscribe(onNext: { urlToImage in
            let imagePath: String = urlToImage
            let imageUrl = URL(string: imagePath)
            cell.newsImage?.setImage(with: imageUrl)
        }).disposed(by: disposeBag)
        
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
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let text = searchBar.text else {return}
        
    }
    
}
