//
//  VideoSharedModel.swift
//  ProjectStructure
//
//  Created by Ascentspark on 12/06/18.
//  Copyright © 2018 Ascentspark. All rights reserved.
//

import UIKit
import ObjectMapper

class VideoSharedModel: NSObject {
    
    private var videoRoot : VideoRoot = VideoRoot()
    private let d = UserDefaults.standard
    
    
    func saveToSharedPrefs(video: VideoRoot!) {
        if video != nil {
            d.set(Mapper().toJSONString(video, prettyPrint: false) , forKey: "VIDEO")
        } else {
            d.set(nil, forKey: "VIDEO")
        }
        d.synchronize()
    }
    
    func getUserFromDefaults() -> VideoRoot! {
        let videoJson = d.string(forKey: "VIDEO")
        return videoJson == nil ? nil : Mapper<VideoRoot>().map(JSONString: videoJson!)
    }
    private static var instance = VideoSharedModel()
    // …
    
    // MARK: Static
    internal static func shared() -> VideoSharedModel {
        return instance
    }
    
}
