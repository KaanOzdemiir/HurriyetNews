//
//  ViewController.swift
//  HurriyetNews
//
//  Created by Kaan Ozdemir on 28.08.2019.
//  Copyright © 2019 Kaan Ozdemir. All rights reserved.
//

import UIKit
import Shimmer

class ArticleListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    let viewModel = ArticleViewModel()

    let cellIdentifier = "NewsCellIdentifier"
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        

        
        viewModel.articleResponse.subscribe(onError: { (error) in
            let alertController = UIAlertController(title: "Oups!", message: error.localizedDescription, preferredStyle: .actionSheet)
            alertController.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alertController, animated: true)
        })
        .disposed(by: viewModel.disposeBag)
        
        
        viewModel.articles.subscribe(onNext: { (articles) in
            self.tableView.reloadData()
        })
        .disposed(by: viewModel.disposeBag)
        
        viewModel.fetchArticles(params: [:])
        
        tableView.register(UINib(nibName: "NewsTableViewCell", bundle: nil), forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "SegueArticleDetailVC", let destination = segue.destination as? ArticleDetailViewController, let article = sender as? ArticleResponse {
            destination.viewModel.fetchArticleBy(id: article.id ?? "0")
        }
    }
}

extension ArticleListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.articles.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! NewsTableViewCell
        
        let article = viewModel.articles.value[indexPath.row]
        
        cell.setWith(article: article)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = viewModel.articles.value[indexPath.row]
        
        
        performSegue(withIdentifier: "SegueArticleDetailVC", sender: article)
    }
    
}

