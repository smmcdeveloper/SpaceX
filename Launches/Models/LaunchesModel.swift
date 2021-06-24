//
//  LaunchModel.swift
//
//  Created by SMMC on 24/06/2021.
//

import Foundation

struct LaunchModel : Codable {
    var mission_name: String = ""
    var launch_date_utc: String = ""
    var launchDateformatted: String? {return usDateToUK(launch_date_utc) }
    var land_success: Bool?
    var links: Links
    
    struct Links: Codable {
        var mission_patch_small: String? = ""
    }
  
    func usDateToUK (_ inpDate: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
       
        let date = dateFormatter.date(from: inpDate)
        dateFormatter.dateFormat = "MM/dd/yyyy"
      
        return dateFormatter.string(from: date!) 
    }
}
