//
//  PhotoViewController.swift
//  Lab 1
//
//  Created by Karan Khurana on 6/16/16.
//  Copyright © 2016 Karan Khurana. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var photoView: UIImageView!
    var image: UIImage!
    
    @IBOutlet weak var doneButton: UIButton!
    @IBOutlet weak var actionButton: UIImageView!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var offset: CGPoint!
    
    var zoomer: Bool!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoView.image = image
        photoView.contentMode = UIViewContentMode.ScaleAspectFit
        
        scrollView.contentSize = CGSize(width: 320, height: 568)
        scrollView.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didTapDone(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        
        if !zoomer {
            let offset = scrollView.contentOffset
            print("\(offset.y/10) & \(offset)")
            scrollView.backgroundColor = UIColor(white: 0, alpha: (1 + (CGFloat(offset.y)/500)))
            doneButton.alpha = 1 + (offset.y/100)
            actionButton.alpha = 1 + (offset.y/100)
             print("view did scroll")
        }
       
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        zoomer = false
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView,
                                  willDecelerate decelerate: Bool) {
        // This method is called right as the user lifts their finger
        let offset = scrollView.contentOffset
        if offset.y < -100 {
            dismissViewControllerAnimated(true, completion: nil)
        } else {
            doneButton.alpha = 1
            actionButton.alpha = 1
        }
        
        print("ended scroll")
    }
    
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return photoView
    }
    
    func scrollViewWillBeginZooming(scrollView: UIScrollView, withView view: UIView?) {
        zoomer = true
        doneButton.alpha = 0
        actionButton.alpha = 0
        print("started zooming")
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        print("scale: \(scale)")
        
        if scale == 1 {
            zoomer = false
            doneButton.alpha = 1
            actionButton.alpha = 1
        }
        print("ended zooming")
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
