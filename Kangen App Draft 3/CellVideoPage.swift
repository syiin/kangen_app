//
//  CellVideoPage.swift
//  Kangen App Draft 3
//
//  Created by Stirling Yiin on 25/04/2017.
//  Copyright © 2017 Stirling. All rights reserved.
//

import UIKit
import MediaPlayer

class CellVideoPage: UIViewController {


    @IBOutlet weak var navBarTitle: UINavigationItem!
    @IBOutlet weak var webView: UIWebView!
    
    private var _modelData: CellModel!
    // var moviePlayer : MPMoviePlayerController!
    
    var modelData: CellModel {
        get {
            return _modelData
        } set {
            _modelData = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        navBarTitle.title = modelData.title
        
        webView.loadHTMLString(modelData.videoURL, baseURL: nil)
        
        //To enable local video
        //let path = Bundle.main.path(forResource: modelData.videoURL, ofType:"mp4")
        //let url = NSURL.fileURL(withPath: path!)
       // self.moviePlayer = MPMoviePlayerController(contentURL: url)
        //if let player = self.moviePlayer {
           // player.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: self.view.frame.size.height)
           // player.view.sizeToFit()
          //  player.scalingMode = MPMovieScalingMode.fill
           // player.isFullscreen = true
           // player.controlStyle = MPMovieControlStyle.embedded
           // player.movieSourceType = MPMovieSourceType.file
            //player.repeatMode = MPMovieRepeatMode.one
            //player.play()
           //self.view.addSubview(player.view)
        //}

    }
    
    @IBAction func backButton(_ sender: Any) {
            // Depending on style of presentation (modal or push presentation), this view controller needs to be dismissed in two different ways.
            let isPresentingInAddMealMode = presentingViewController is UINavigationController
            
            if isPresentingInAddMealMode {
                dismiss(animated: true, completion: nil)
            }
            else if let owningNavigationController = navigationController{
                owningNavigationController.popViewController(animated: true)
            }
            else {
                fatalError("The MealViewController is not inside a navigation controller.")
            }
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
