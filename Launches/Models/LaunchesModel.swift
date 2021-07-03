//
//  LaunchModel.swift
//
//  Created by SMMC on 24/06/2021.
//

import Foundation

struct LaunchModel: Decodable {
    
    var name: String?
    var date_local: String
    var launchDateformatted: String {return usDateToUK(date_local)}
    var success: Bool?
    var links: LinkModel?
    
    func usDateToUK (_ inpDate: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        var dateSting: String = ""
        
        if let date = dateFormatter.date(from: inpDate ?? "") {
            let displayFormater = DateFormatter()
            displayFormater.dateFormat = "MMM dd, y"
            dateSting = displayFormater.string(from: date)
        }
     
        return dateSting
    }
}
