//
//  ThrillistViewController.swift
//  Lab 1
//
//  Created by Karan Khurana on 5/19/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class ThrillistViewController: UIViewController {

    @IBOutlet weak var backButton: UIButton!
    @IBAction func backButton(sender: AnyObject) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
