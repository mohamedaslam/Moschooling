//
//  APIRequest.swift
//  OrganizedProject
//
//  Created by Ghouse Basha Shaik on 30/01/18.
//  Copyright © 2018 Ghouse Basha Shaik. All rights reserved.
//

import Foundation

class APIRequest {
    var urlString : String = ""
    var httpMethod : String = ""
    var headers : [String:AnyObject]? = [:]
    var parameters: AnyObject? = nil
    var httpBody: Data? = nil
}
