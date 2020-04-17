//
//  DetailViewController.swift
//  GitTest
//
//  Created by Admin on 15/04/20.
//  Copyright © 2020 Admin. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, StoryboardLoadable, UISearchBarDelegate {
    
    @IBOutlet weak var imgUser: UIImageView!
    
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblJoinDate: UILabel!
    @IBOutlet weak var lblFollowers: UILabel!
    @IBOutlet weak var lblFollowings: UILabel!
    
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var searchBox: UISearchBar!
    @IBOutlet weak var tblViewSearch: UITableView!
    
    var dictUserDetails = NSMutableDictionary()
    var arrUserTopic = NSMutableArray()
    var strUsername = String()
    var activityView: UIActivityIndicatorView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.searchBox?.delegate = self
        tblViewSearch.register(UINib(nibName: "DetailsUserTopicCell", bundle: nil), forCellReuseIdentifier: "DetailsUserTopicCell")
        getUserDetails(userName: strUsername)
    }
    
    // MARK: - Get User Detail
    func getUserDetails(userName: String){
        self.showActivityIndicator()
        BackendUtilities.clickedDetailsUser(userName, completionHandler: { (data, statusCode, message) in
            self.hideActivityIndicator()
            self.dictUserDetails = data.mutableCopy() as! NSMutableDictionary
            self.setData(data: self.dictUserDetails)
            self.getAllRepoList()
        })
    }
    
    // MARK: - Get repo list
    func getAllRepoList(){
        self.showActivityIndicator()
        BackendUtilities.clickedDetailSearch(strUsername, "", completionHandler: { (data,statusCode,message) in
            self.hideActivityIndicator()
            self.arrUserTopic = data.mutableCopy() as! NSMutableArray
            self.tblViewSearch.reloadData()
        })
    }
    
    // MARK: - Search Delegate
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        NSObject.cancelPreviousPerformRequests(withTarget: self, selector: #selector(self.reload(_:)), object: searchBar)
        perform(#selector(self.reload(_:)), with: searchBar, afterDelay: 0.75)
    }
    
    // MARK: - Serach by text
    @objc func reload(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, query.trimmingCharacters(in: .whitespaces) != "" else {
            print("nothing to search")
            self.arrUserTopic.removeAllObjects()
            self.tblViewSearch.reloadData()
            return
        }
        print(query)
        self.showActivityIndicator()
        BackendUtilities.clickedDetailSearch(strUsername, query, completionHandler: { (data,statusCode,message) in
            self.hideActivityIndicator()
            self.arrUserTopic = data.mutableCopy() as! NSMutableArray
            self.tblViewSearch.reloadData()
        })
    }
    
    // MARK: - Load Data
    func setData(data: NSMutableDictionary){
        if let imguse = data.value(forKey: "avatar_url")
        {
            let imgUrl = "\(imguse)"
            let url = URL.init(string:imgUrl)
            imgUser.sd_setImage(with: url , placeholderImage: UIImage(named: "default"))
        }
        
        lblUsername.text = data.value(forKey: "name") as? String
        if (data.value(forKey: "email") as? String != nil){
            lblEmail.text = data.value(forKey: "email") as? String
        }else{
            lblEmail.text = "N.A."
        }
        
        lblLocation.text = data.value(forKey: "location") as? String
        lblBio.text = data.value(forKey: "bio") as? String
        
        lblBio.adjustsFontSizeToFitWidth = true
        
        lblJoinDate.text = data.value(forKey: "created_at") as? String
        
        if (data.value(forKey: "followers") as? Int != nil){
            let followers = data.value(forKey: "followers") as? Int
            lblFollowers.text = "\(followers!) " + " Followers"
        }else{
            lblFollowers.text = "0 " + " Followers"
        }
        
        if (data.value(forKey: "following") as? Int != nil){
            let following = data.value(forKey: "following") as? Int
            lblFollowings.text =   "Following " + "\(following!)"
        }else{
            lblFollowings.text =   "Following " + "0"
        }
    }
    
    // MARK: - Indicater Show
    func showActivityIndicator() {
        self.activityView = UIActivityIndicatorView(style: UIActivityIndicatorView.Style.large)
        activityView?.center = self.view.center
        self.view.addSubview(activityView!)
        activityView?.startAnimating()
    }

    // MARK: - Indicater Hide
    func hideActivityIndicator(){
        if (activityView != nil){
            activityView?.stopAnimating()
        }
    }
    
    // MARK: - Action on Corss
    @IBAction func actionOnCross(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UITableView
extension DetailViewController : UITableViewDataSource , UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrUserTopic.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tblViewSearch.dequeueReusableCell(withIdentifier: "DetailsUserTopicCell", for: indexPath) as! DetailsUserTopicCell
        cell.selectionStyle = .none
        cell.lblRepoName.text = (self.arrUserTopic[indexPath.row] as AnyObject).value(forKey: "name") as? String
        let Froks = (self.arrUserTopic[indexPath.row] as AnyObject).value(forKey: "forks") as? Int
        cell.lblFroks.text = "\(Froks!) " + " Forks"
        
        let Stars = (self.arrUserTopic[indexPath.row] as AnyObject).value(forKey: "stargazers_count") as? Int
        cell.lblStars.text = "\(Stars!) " + " Stars"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repoURL = (self.arrUserTopic[indexPath.row] as AnyObject).value(forKey: "html_url") as! String
        UIApplication.shared.openURL(NSURL(string: repoURL)! as URL)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
