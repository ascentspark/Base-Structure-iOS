//
//  UIStoryboard+Extension.swift
//  ProjectStructure
//
//  Created by Ascentspark on 12/06/18.
//  Copyright © 2018 Ascentspark. All rights reserved.
//

import UIKit

extension UIStoryboard {
    public static var mainStoryboard: UIStoryboard? {
        let bundle = Bundle.main
        guard let name = bundle.object(forInfoDictionaryKey: "UIMainStoryboardFile") as? String else {
            return nil
        }
        return UIStoryboard(name: name, bundle: bundle)
    }
    
    static var Main: UIStoryboard {
        if let main = mainStoryboard {
            return main
        }
        return UIStoryboard(name: "Main", bundle: nil)
    }
    
    class func instantiateViewController<T: UIViewController>(withViewClass: T.Type) -> T {
        return UIStoryboard.Main.instantiateViewController(withIdentifier: String(describing: withViewClass.self)) as! T
    }
}

