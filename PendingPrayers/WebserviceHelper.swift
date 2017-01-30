//
//  WebserviceHelper.swift
//  PendingPrayers
//
//  Created by Mohan on 1/30/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import Foundation
import Alamofire
class WebserviceHelper{
    public func getData(url:URLConvertible,method:HTTPMethod,parameters:Parameters?,headers:HTTPHeaders?,onCompletion: @escaping (DataResponse<Any>)->()){
        
        Alamofire.request(url, method: method, parameters: parameters, encoding:JSONEncoding.default, headers: headers).responseJSON(completionHandler: onCompletion)
    }
}

extension WebserviceHelper{
    public func loginUser(_ params:[String:AnyObject] , comletionHandler:@escaping(([String:String]?,_ errorType:String) -> ())){
        //call the webservice
        self.getData(url: URL(string: "")!, method: .post, parameters: params, headers: nil, onCompletion: {
            response in
            switch response.result {
            case .success(_):
                if let statusCode = response.response?.statusCode {
                    switch statusCode {
                    case 200:
        
                        comletionHandler(["":""],"")
                        break
                    case 401:
                      
                        comletionHandler(nil,"error")
                        break
                        
                    default:
                       
                        comletionHandler(nil,"error")
                        break
                        
                    }
                }
                
            case .failure(let error):
                comletionHandler(nil,error.localizedDescription)
            }
            
        })
    }

}
