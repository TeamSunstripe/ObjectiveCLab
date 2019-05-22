//
//  UserModel.swift
//  testCode
//
//  Created by YouOhshima on 2019/05/15.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

import Foundation

class UserModel : NSObject {
    
    var resource: UserData? = nil
    let requestApiURL = "https://user?id=0000000000"
    
    func getResource() -> UserData? {
        return resource
    }
    
    func requestApi() {
        /*
         let manager = AFHTTPRequestOperationManager()
         manager.GET(
         self.atnd_url,
         parameters: nil,
         success: {
         (operation: AFHTTPRequestOperation!, responseObject: AnyObject!) in
         if let dict = responseObject as? NSDictionary{
         if let events: NSArray = dict["events"] as? NSArray{
         var tmp_objects = [EventData]()
         for event in events{
         tmp_objects += EventData(event: event as NSDictionary)
         }
         self.resources = tmp_objects
         }
         }
         },
         failure: {
         (operation: AFHTTPRequestOperation!, error: NSError!) in
         println(error.localizedDescription)
         })
         */
        let tmp_object = UserData.init(user: ["name":"","password":""])
        self.resource = tmp_object
    }
}
