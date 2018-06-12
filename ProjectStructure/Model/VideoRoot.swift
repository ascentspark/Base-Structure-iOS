//
//  VideoRoot.swift
//  ProjectStructure
//
//  Created by Ascentspark on 12/06/18.
//  Copyright © 2018 Ascentspark. All rights reserved.
//

import Foundation
import ObjectMapper

class VideoRoot : Mappable{
    
    var success : Bool!
    var data : [VideoData] = []
    
    init() {}
    
    required init?(map: Map) {
    }
    
    func mapping(map: Map) {
        success <- map["success"]
        data <- map["data"]
    }
}
class VideoData : Mappable{
    var id  = 0
    var title = ""
    var file = ""
    var slug = ""
    var description = ""
    var excerpt = ""
    var thumnailImage = ""
    var hoverImage = ""
    var views = ""
    var rating = 0
    var categorySlug = ""
    var catSlug = ""
    var likes = 0
    var shares = 0
    var mostVideoHumandate = ""
    
    init() {
    }
    required init?(map: Map) {
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        file <- map["file"]
        slug <- map["slug"]
        description <- map["description"]
        excerpt <- map["excerpt"]
        thumnailImage <- map["thumbnail_image"]
        hoverImage <- map["hover_image"]
        views <- map["views"]
        rating <- map["rating"]
        categorySlug <- map["category_slug"]
        catSlug <- map["catSlug"]
        likes <- map["likes"]
        shares <- map["shares"]
        mostVideoHumandate <- map["mostVideoHumandate"]
    }
}
