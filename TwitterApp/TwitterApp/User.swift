//
//  User.swift
//  TwitterApp
//
//  Created by Tejal Par on 9/28/14.
//

import UIKit

var _currentUser: User?
let currentUserKey = "kCurrentUserKey"
let userDidLoginNotification = "userDidLoginNotification"
let userDidLogoutNotification = "userDidLogoutNotification"

class User: NSObject {
    
    var name: String?
    var screenName: String?
    var profileImageUrl: String?
    var tagLine: String?
    var dictionary: NSDictionary
    var tweetCount: NSNumber?
    var followersCount: NSNumber?
    var followingCount: NSNumber?
    
    init(dictionary: NSDictionary){
        self.dictionary = dictionary
        //println(dictionary)
        name = dictionary["name"] as? String
        screenName = dictionary["screen_name"] as? String
        profileImageUrl = dictionary["profile_image_url"] as? String
        tagLine = dictionary["description"] as? String
        tweetCount = dictionary["statuses_count"] as? NSNumber
        followersCount = dictionary["followers_count"] as? NSNumber
        followingCount = dictionary["friends_count"] as? NSNumber
    }
    
    func logout(){
        User.currentUser = nil
        TwitterClient.sharedInstance.requestSerializer.removeAccessToken()
        
        NSNotificationCenter.defaultCenter().postNotificationName(userDidLogoutNotification, object: nil)
    }
    
    class var currentUser: User?{
        
        get{
            if _currentUser == nil{
                var data = NSUserDefaults.standardUserDefaults().valueForKey(currentUserKey) as? NSData
        
                if data != nil{
                    var dictionary = try! NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.MutableContainers) as! NSDictionary
                    _currentUser = User(dictionary: dictionary)
                }
            }
            return _currentUser
        }
        set(user) {
            _currentUser = user
            
            if _currentUser != nil{
                let data = try? NSJSONSerialization.dataWithJSONObject(user!.dictionary, options: [])
                NSUserDefaults.standardUserDefaults().setObject(data, forKey: currentUserKey)
                
            }
            else{
                NSUserDefaults.standardUserDefaults().setObject(nil, forKey: currentUserKey)
            }
            NSUserDefaults.standardUserDefaults().synchronize()
        }
    }
}
