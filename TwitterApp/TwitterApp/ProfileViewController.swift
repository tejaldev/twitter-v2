//
//  ProfileViewController.swift
//  TwitterApp
//
//  Created by Tejal Par on 10/6/14.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var profileImageView: UIImageView!
    @IBOutlet var followersLabel: UILabel!
    @IBOutlet var followingLabel: UILabel!
    @IBOutlet var tweetsLabel: UILabel!
    @IBOutlet var tagLabel: UILabel!
    @IBOutlet var userNameLabel: UILabel!
    var userInfo: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadUserDetails()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setupUser(user: User){
        self.userInfo = user
    }
    
    func loadUserDetails(){
        userNameLabel.text = self.userInfo?.name
        tagLabel.text = self.userInfo?.tagLine
        
        let profileImageURL = self.userInfo?.profileImageUrl
        profileImageView.setImageWithURL(NSURL(string:profileImageURL!))
        
        tweetsLabel.text = self.userInfo?.tweetCount?.stringValue
        followingLabel.text = self.userInfo?.followingCount?.stringValue
        followersLabel.text = self.userInfo?.followersCount?.stringValue
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
