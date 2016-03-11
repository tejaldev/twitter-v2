//
//  HamburgerMenuViewController.swift
//  TwitterApp
//
//  Created by Tejal Par on 10/6/14.
//

import UIKit

class HamburgerMenuViewController: UIViewController {
    
   
    @IBOutlet var rootView: UIView!
    @IBOutlet var profileMenuLabel: UILabel!
    @IBOutlet var mentionsMenuLabel: UILabel!
    @IBOutlet var homeMenuLabel: UILabel!
    @IBOutlet var profileImage: UIImageView!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var submenuView: UIView!
    
    var hamviewController: UIViewController?
    var userInfo: User!
    var isOpen = false
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.loadUserDetails()
        
        if let vc = hamviewController {
            vc.view.frame = rootView.frame
            rootView.addSubview(vc.view)
        }
        showView()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func showView() {
        submenuView.frame.origin.x = isOpen ? 0 : -100
        rootView.frame.origin.x = isOpen ? 100 : 0
    }
    
    func showViewMenu() {
        submenuView.frame.origin.x = isOpen ? 0 : -200
        rootView.frame.origin.x = isOpen ? 200 : 0
    }
    
    func setupUser(user: User){
        self.userInfo = user
    }
    
    @IBAction func onProfileTapped(sender: UITapGestureRecognizer) {
        UIView.animateWithDuration(0.4, animations: {
            () -> Void in
            self.isOpen = false
            self.showView()
            self.hamviewController?.performSegueWithIdentifier("composeSegue", sender: self)
        })
    }
    
    func loadUserDetails(){
        usernameLabel.text = self.userInfo?.name
        let profileImageURL = self.userInfo?.profileImageUrl
        profileImage.setImageWithURL(NSURL(string:profileImageURL!))
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
