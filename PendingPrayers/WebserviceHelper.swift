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
    public func getData(url:URLConvertible,method:HTTPMethod,parameters:[String:String]?,headers:HTTPHeaders?,onCompletion: @escaping (DataResponse<Any>)->()){
        
        Alamofire.request(url, method: method, parameters: parameters, headers: headers).responseJSON(completionHandler: onCompletion)
    }
}

extension WebserviceHelper{
    public func loginUser(_ params:[String:String] , comletionHandler:@escaping(([String:String]?,_ errorType:String) -> ())){
        //call the webservice
        self.getData(url: URL(string: "http://creatudevelopers.com.np/creatude_webservice1/login.php")!, method: .post, parameters: params, headers: nil, onCompletion: {
            response in
            switch response.result {
            case .success(let resultData):
                if let statusCode = response.response?.statusCode {
                    switch statusCode {
                    case 200:
                        let data = resultData as! [String:String]
                        if data["status"] == "OK"{
                        comletionHandler(data,"")
                        }
                        else{
                        comletionHandler(nil,"")
                        }
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
    public func prayUser(_ params:[String:String] , comletionHandler:@escaping(([String:String]?,_ errorType:String) -> ())){
        //call the webservice
        self.getData(url: URL(string: "http://creatudevelopers.com.np/creatude_webservice1/prayer.php")!, method: .post, parameters: params, headers: nil, onCompletion: {
            response in
            switch response.result {
            case .success(let resultData):
                if let statusCode = response.response?.statusCode {
                    switch statusCode {
                    case 200:
                        let data = resultData as! [String:String]
                        if data["status"] == "OK"{
                            comletionHandler(data,"")
                        }
                        else{
                            comletionHandler(nil,"")
                        }
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
