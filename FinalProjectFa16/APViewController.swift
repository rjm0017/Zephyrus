//
//  APViewController.swift
//  FinalProjectFa16
//
//  Created by Jake Mullins on 11/23/16.
//  Copyright © 2016 Jake Mullins. All rights reserved.
//

import UIKit

var up_speed_ret = Double(0.0)
var down_speed_ret = Double(0.0)
var start = Date()
var end = Date()


class APViewController: UIViewController {

    
    // MARK: Fields
    // url - http://138.197.30.160/outbound/TPMidna.jpg
    
    
    @IBOutlet weak var DownloadInfo: UILabel!
    @IBOutlet weak var imagedl: UIImageView!
    
    let Space_picSize = Int(763251)
    let BotW_picSize = Int(2891975)
    let TPMidna_picSize = Int(284720)
    //size of img being uploaded/downloaded (in BYTES)
    //divide by 8 when calc mbps/kbps
    //have a way to test final value and change unit/decimal
        //location for easy reading
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func runTest(_ sender: AnyObject) {
        //this is what will be activated by "Run Test" button
        DownloadInfo.text = "Loading..."
    
        //comment lines separate the core functionality from the timer stuff.
        //use the timer stuff when doing a syncronized download to get
        //the time it takes to complete
        func test_download() {
            //----------------
            Double(downTest())

            
        }

        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1, execute: test_download)
       

        
    }
    //---------------------------------------------------------------------------------------------
    /*
     * The only part of the code that needs to change from here on out is the below functions.
     * There may need to be some more functions/nested functions added to make it work properly,
     * but the above is already coded to handle the speed value (as a double) and put it on screen.
     */
    
    
    func getImg() {
      /*  let url = URL(string: "http://138.197.30.160/outbound/TPMidna.jpg")
        let request = URLRequest(url: url!)
        let task = URLSession.shared.dataTask(with: request, completionHandler: {(data, response, error) -> Void in
            if error != nil {
                print("some error!")
            } else {
                if let midna = UIImage(data: data!) {
                    self.imagedl.image = midna
                }
            }
        })
        task.resume()
        */
        let url = URL(string: "http://138.197.30.160/outbound/TPMidna.jpg")
        let request = URLRequest(url: url!)
        let startTime = Date()
        let task =  URLSession.shared.dataTask(with: request) { (data, response, error) -> Void in
            
            if error != nil {
                print("connection error or data is nill")
                return
            }
            else {
                let pic_size_mb  = Double((response?.expectedContentLength)!) / 1000000.0
                print(pic_size_mb)
                let end = Date()
                let runtime = Double(end.timeIntervalSince(startTime))
                var u_speed = Double(pic_size_mb/runtime)
                u_speed = round(1000 * u_speed) / 1000
                self.DownloadInfo.text = String(u_speed) + " Mbps"
                
            }

        }
        task.resume()
    }

    
    func downTest() -> Double {
        getImg()
        return down_speed_ret
    }
    
    func upTest() -> Double {
        
        return up_speed_ret
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    


}




