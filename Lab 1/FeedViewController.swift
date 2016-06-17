//
//  FeedViewController.swift
//  Lab 1
//
//  Created by Karan Khurana on 5/19/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class FeedViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var feedView: UIImageView!
    var selectedImage: UIImageView!
    var lightboxTransition: LightBoxTransition!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.contentSize = feedView.image!.size
        scrollView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    @IBAction func onTapPhoto(sender: UITapGestureRecognizer) {
        
        selectedImage = sender.view as! UIImageView
        
        performSegueWithIdentifier("feedToPhotoSegue", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        let destinationViewController = segue.destinationViewController as! PhotoViewController
        
        destinationViewController.image = self.selectedImage.image
        
        
        // Set the modal presentation style of your destinationViewController to be custom.
        destinationViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        
        // Create a new instance of your fadeTransition.
        lightboxTransition = LightBoxTransition()
        
        // Tell the destinationViewController's  transitioning delegate to look in fadeTransition for transition instructions.
        destinationViewController.transitioningDelegate = lightboxTransition
        
        // Adjust the transition duration. (seconds)
        lightboxTransition.duration = 0.35
        
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
