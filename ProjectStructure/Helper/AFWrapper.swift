//
//  AFWrapper.swift
//  ProjectStructure
//
//  Created by Ascentspark on 12/06/18.
//  Copyright © 2018 Ascentspark. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class AFWrapper : NSObject {
    
    class func requestGet(_ strUrl: String, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void) {
        
        Alamofire.request(strUrl).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    class func requestGetUrlWithParam(_ strUrl : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        
        let header:[String : String] = [:]
        Alamofire.request(strUrl, method: .get, parameters: params, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
    class func requestPost(_ strUrl : String, params : [String : AnyObject]?, headers : [String : String]?, success:@escaping (JSON) -> Void, failure:@escaping (Error) -> Void){
        
        let header:[String : String] = [:]
        print(header)
        Alamofire.request(strUrl, method: .post, parameters: params, headers: header).responseJSON { (responseObject) -> Void in
            if responseObject.result.isSuccess {
                let resJson = JSON(responseObject.value!)
                success(resJson)
            }
            if responseObject.result.isFailure {
                let error : Error = responseObject.result.error!
                failure(error)
            }
        }
    }
}
