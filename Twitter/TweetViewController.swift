//
//  TweetViewController.swift
//  Twitter
//
//  Created by Josef Vodicka on 10/3/22.
//  Copyright © 2022 Dan. All rights reserved.
//

import UIKit

class TweetViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tweetText.becomeFirstResponder()

        // Do any additional setup after loading the view.
    }
    
    @IBOutlet weak var tweetText: UITextView!
    
    
    @IBAction func cancel(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
    @IBAction func tweet(_ sender: Any) {
        
        if(!tweetText.text.isEmpty){
            TwitterAPICaller.client?.postTweet(tweetString: tweetText.text, success: {self.dismiss(animated: true)}, failure: {
                (error) in print("Error posting tweet \(error)")
                self.dismiss(animated: true)
            })
        }
        
        else{
            self.dismiss(animated: true)
        }
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
