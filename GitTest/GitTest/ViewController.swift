//
//  ViewController.swift
//  GitTest
//
//  Created by Admin on 14/04/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit
import SDWebImage

class ViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchbar: UISearchBar!
    
    var activityView: UIActivityIndicatorView?
    var listSearchText : String = ""
    var arrUserList = NSMutableArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchbar?.delegate = self
        tblView.register(UINib(nibName: "GitUserCell", bundle: nil), forCellReuseIdentifier: "GitUserCell")
        tblView.isHidden = true
    }
    
    // MARK: - Search text
    @objc func sourceSearchMethod() {
        if (self.listSearchText != ""){
            self.showActivityIndicator()
            BackendUtilities.searchGITUser(listSearchText, completionHandler: { (data,statusCode,message) in
                self.hideActivityIndicator()
                self.arrUserList = data.mutableCopy() as! NSMutableArray
                self.tblView.isHidden = false
                self.tblView.reloadData()
            })
        }else{
            self.arrUserList.removeAllObjects()
            self.tblView.isHidden = true
            self.tblView.reloadData()
        }
    }
    
    // MARK: - Search Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.75)
    }
    
    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            print("nothing to search")
            self.arrUserList.removeAllObjects()
            self.tblView.isHidden = true
            self.tblView.reloadData()
            return
        }
        print(query)
        self.showActivityIndicator()
        BackendUtilities.searchGITUser(query, completionHandler: { (data,statusCode,message) in
            self.hideActivityIndicator()
            self.arrUserList = data.mutableCopy() as! NSMutableArray
            self.tblView.isHidden = false
            self.tblView.reloadData()
        })
    }
}

// MARK: - UITableView
extension ViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrUserList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblView.dequeueReusableCell(withIdentifier: "GitUserCell", for: indexPath) as! GitUserCell
            
        if let imguse = (self.arrUserList[indexPath.row] as AnyObject).value(forKey: "avatar_url") as? String
        {
            let imgUrl = "\(imguse)"
            let url = URL.init(string:imgUrl)
            cell.imgUser.sd_setImage(with: url , placeholderImage: UIImage(named: "user_defolt"))
            cell.imgUser.tag = indexPath.row
        }
        
        cell.lblUserName.text = (self.arrUserList[indexPath.row] as AnyObject).value(forKey: "login") as? String
        
        cell.selectionStyle = .none
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let nextViewController = storyBoard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        nextViewController.strUsername = (self.arrUserList[indexPath.row] as AnyObject).value(forKey: "login") as! String
        self.present(nextViewController, animated:true, completion:nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func showActivityIndicator() {
        self.activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
}

