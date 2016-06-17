//
//  LightBoxTransition.swift
//  Lab 1
//
//  Created by Karan Khurana on 6/16/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class LightBoxTransition: BaseTransition {
    override func presentTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabCtrl = fromViewController as! UITabBarController
        let navCtrl = tabCtrl.viewControllers![0] as! UINavigationController
        
        
        let feedViewController = navCtrl.viewControllers[0] as! FeedViewController
        let photoViewController = toViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        movingImageView.image = feedViewController.selectedImage.image
        movingImageView.frame = containerView.convertRect(feedViewController.selectedImage.frame, fromView: feedViewController.selectedImage.superview)
        movingImageView.contentMode = feedViewController.selectedImage.contentMode
        
        containerView.addSubview(movingImageView)
        
        photoViewController.photoView.alpha = 0

        toViewController.view.alpha = 0
        
        
        UIView.animateWithDuration(duration, animations: {
            toViewController.view.alpha = 1
            
            movingImageView.frame = photoViewController.photoView.frame
            movingImageView.contentMode = UIViewContentMode.ScaleAspectFit
        }) { (finished: Bool) -> Void in
            photoViewController.photoView.alpha = 1
            movingImageView.alpha = 0
            movingImageView.hidden = true
            self.finish()
        }
    }
    
    override func dismissTransition(containerView: UIView, fromViewController: UIViewController, toViewController: UIViewController) {
        
        let tabCtrl = toViewController as! UITabBarController
        let navCtrl = tabCtrl.viewControllers![0] as! UINavigationController
        
        
        let feedViewController = navCtrl.viewControllers[0] as! FeedViewController
        let photoViewController = fromViewController as! PhotoViewController
        
        let movingImageView = UIImageView()
        movingImageView.image = photoViewController.photoView.image
        movingImageView.frame = photoViewController.photoView.frame
        movingImageView.contentMode = photoViewController.photoView.contentMode
        
        containerView.addSubview(movingImageView)
        
        feedViewController.selectedImage.alpha = 0
        
        fromViewController.view.alpha = 1
        UIView.animateWithDuration(duration, animations: {
            fromViewController.view.alpha = 0
            movingImageView.frame = containerView.convertRect(feedViewController.selectedImage.frame, fromView: feedViewController.selectedImage.superview)
            movingImageView.contentMode = UIViewContentMode.ScaleAspectFit
        }) { (finished: Bool) -> Void in
            feedViewController.selectedImage.alpha = 1
            movingImageView.alpha = 0
            self.finish()
        }
    }

}
