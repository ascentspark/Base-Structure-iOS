//
//  ViewController.swift
//  ProjectStructure
//
//  Created by Ascentspark on 12/06/18.
//  Copyright © 2018 Ascentspark. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var nextButton: UIButton!
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.navigationItem.title = "ViewController"
        self.navigationController?.navigationBar.barTintColor = Constants.Colours.baseColour
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.nextButton.addTarget(self, action: #selector(goToNextVC), for: .touchUpInside)
    }
    
    //MARK: Navigate to next VC
    @objc func goToNextVC(){
        let vc = UIStoryboard.instantiateViewController(withViewClass: ViewControllerNext.self)
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    //MARK: Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

