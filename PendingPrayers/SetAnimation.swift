//
//  SetAnimation.swift
//  PendingPrayers
//
//  Created by Mohan on 1/31/17.
//  Copyright © 2017 EBPearls. All rights reserved.
//

import Foundation
import NVActivityIndicatorView

struct SetAnimation{
    
    struct forDataFetching{
        
        static func startAnimation(){
            let activityData = ActivityData()
            NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
        }
        
        static func stopAnimation(){
            NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
        }
    }

}
