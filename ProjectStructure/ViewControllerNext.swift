//
//  ViewControllerNext.swift
//  ProjectStructure
//
//  Created by Ascentspark on 12/06/18.
//  Copyright © 2018 Ascentspark. All rights reserved.
//

import UIKit
import ObjectMapper
import SDWebImage

class ViewControllerNext: UIViewController {
    
    @IBOutlet weak var tableView : UITableView!
    var videoRoot : VideoRoot = VideoRoot()
    
    //MARK: View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.navigationItem.title = "ViewControllerNext"
        if let videoRoot = VideoSharedModel.shared().getUserFromDefaults(){
            self.videoRoot = videoRoot
            if videoRoot.data.count > 0{
                self.tableView.reloadData()
            }
            else{
                getAllData()
            }
        }
        else{
            getAllData()
        }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.dataSource = self
        self.tableView.delegate = self
        self.tableView.separatorColor = Constants.Colours.baseColour
    }
    
    //MARK: API call
    func getAllData(){
        AFWrapper.requestGet(Constants.Api.getMostSharedVideos, success: {[weak self] (json) in
            guard let strongSelf = self else{return}
            strongSelf.videoRoot =  Mapper<VideoRoot>().map(JSONObject: json.rawValue)!
            if strongSelf.videoRoot.success{
                VideoSharedModel.shared().saveToSharedPrefs(video: strongSelf.videoRoot)
                strongSelf.tableView.reloadData()
            }else{
                print("NO DATA")
                return
            }
        }) { (error) in
            print("ERROR \(error)")
            return
        }
    }
    
    //MARK: Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
//MARK: Extension UITableView DataSource, Delegate
extension ViewControllerNext : UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videoRoot.data.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoTableViewCell", for: indexPath) as! VideoTableViewCell
        let data = videoRoot.data[indexPath.row]
        cell.titleLabel.text = data.title
        cell.mainImageView.sd_setImage(with: URL(string: data.thumnailImage), completed: nil)
        return cell
    }
}
extension ViewControllerNext : UITableViewDelegate{
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //You can also go for UITableViewAutomaticDimension
        return 100
    }
}
