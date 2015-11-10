//
//  InboxViewController.swift
//  Mailbox Prototype
//
//  Created by Benji Renzo Kuroda on 11/8/15.
//  Copyright © 2015 Benji Renzo Kuroda. All rights reserved.
//

import UIKit

class InboxViewController: UIViewController {

    
    @IBOutlet var messageView: UIView!
    @IBOutlet var archiveView: UIView!
    @IBOutlet var laterView: UIView!
    @IBOutlet var fullView: UIView!
    
    @IBOutlet var inboxScrollView: UIScrollView!
    @IBOutlet var messageImageView: UIImageView!
    @IBOutlet var feedImageView: UIImageView!
    @IBOutlet var listIcon: UIImageView!
    @IBOutlet var laterIcon: UIImageView!
    @IBOutlet var deleteIcon: UIImageView!
    @IBOutlet var archiveIcon: UIImageView!
    @IBOutlet var listView: UIView!
    @IBOutlet var rescheduleView: UIView!

    
    var messageStartPan: CGPoint!
    var messageStart: CGPoint!
    var archiveIconStart: CGPoint!
    var archiveIconStartPan: CGPoint!
    var deleteIconStart: CGPoint!
    var deleteIconStartPan: CGPoint!
    var laterIconStart: CGPoint!
    var laterIconStartPan: CGPoint!
    var listIconStart: CGPoint!
    var listIconStartPan: CGPoint!
    var feedImageStart: CGPoint!
    var feedImageStartUp: CGPoint!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        inboxScrollView.contentSize = CGSize(width:320, height: 1367)
        
        messageStart = messageView.center
        archiveIconStart = archiveIcon.center
        deleteIconStart = deleteIcon.center
        laterIconStart = laterIcon.center
        listIconStart = listIcon.center
        feedImageStart = feedImageView.center
        
        self.listIcon.alpha = 0
        self.laterIcon.alpha = 0
        self.archiveIcon.alpha = 0
        self.deleteIcon.alpha = 0
        self.listView.alpha = 0
        self.rescheduleView.alpha = 0

        
        
        archiveView.backgroundColor = UIColor.grayColor()
        
        laterView.backgroundColor = UIColor.grayColor()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func messagePan(sender: UIPanGestureRecognizer) {
        var messageTranslation = sender.translationInView(messageView)
        
        var velocity = sender.velocityInView(messageView)
        
        
        if sender.state == UIGestureRecognizerState.Began {
            
            messageStartPan = messageStart
            archiveIconStartPan = archiveIconStart
            deleteIconStartPan = deleteIconStart
            laterIconStartPan = laterIconStart
            listIconStartPan = listIconStart
            feedImageStartUp = feedImageStart
            
            
        } else if sender.state == UIGestureRecognizerState.Changed {
            
            messageView.center = CGPoint(x:messageStartPan.x + messageTranslation.x, y:messageStartPan.y)
            
            if messageTranslation.x > 0 && messageTranslation.x <= 60 {
                
                self.archiveView.alpha = 1

                UIImageView.animateWithDuration(0.5, animations: { () -> Void in
                    self.archiveIcon.alpha = 1
                })
                
                self.archiveIcon.alpha = 1
                
                self.archiveView.backgroundColor = UIColor.grayColor()
                
                
            } else if messageTranslation.x > 60 && messageTranslation.x <= 200 {
                self.archiveView.alpha = 1

                
                self.archiveIcon.alpha = 1
                self.deleteIcon.alpha = 0
                
                self.archiveIcon.center = CGPoint(x:self.archiveIconStartPan.x + (messageTranslation.x)-60, y:self.archiveIconStartPan.y)
                
                self.archiveView.backgroundColor = UIColor(red:0.48, green:0.87, blue:0.42, alpha:1.0)
                
            } else if messageTranslation.x > 200 {
                self.archiveView.backgroundColor = UIColor(red:0.95, green:0.37, blue:0.23, alpha:1.0)
                self.archiveView.alpha = 1

                
                self.archiveIcon.alpha = 0
                self.deleteIcon.alpha = 1
                
                self.deleteIcon.center = CGPoint(x:self.deleteIconStartPan.x + (messageTranslation.x)-60, y:self.deleteIconStartPan.y)
            }
            
            if messageTranslation.x < 0 && messageTranslation.x >= -60 {
                self.archiveView.alpha = 0
                self.laterView.backgroundColor = UIColor.grayColor()
                
                UIImageView.animateWithDuration(0.5, animations: { () -> Void in
                    self.laterIcon.alpha = 1
                })
                
                self.laterIcon.alpha = 1
                self.listIcon.alpha = 0
                
                
            } else if messageTranslation.x < -60 && messageTranslation.x >= -200 {
                
                self.archiveView.alpha = 0

                
                self.laterIcon.alpha=1
                self.listIcon.alpha=0
                
                self.laterIcon.center = CGPoint(x:self.laterIconStartPan.x + messageTranslation.x + 60, y:self.laterIconStartPan.y)
                
                self.laterView.backgroundColor = UIColor(red:1.00, green:0.84, blue:0.23, alpha:1.0)
                
                
            } else if messageTranslation.x < -200 {
                
                self.archiveView.alpha = 0
                
                self.laterIcon.alpha = 0
                self.listIcon.alpha = 1
                
                self.listIcon.center = CGPoint(x:self.listIconStartPan.x + messageTranslation.x + 60, y:self.listIconStartPan.y)
                
                self.laterView.backgroundColor = UIColor(red:0.88, green:0.69, blue:0.50, alpha:1.0)
            }

        } else if sender.state == UIGestureRecognizerState.Ended {
            print ("pan ended")
            
            if messageTranslation.x > 0 && messageTranslation.x <= 60 {
                self.messageView.frame.origin.x = 0
                
                
            }
            
            if messageTranslation.x > 60 && messageTranslation.x <= 200 {
                self.messageView.frame.origin.x = 340
                
                self.archiveIcon.center.x = 340
                
                UIView.animateWithDuration(0.5, delay: 0.25, options: [], animations: { () -> Void in
                    self.feedImageView.frame.origin.y = 0
                    }, completion: { (Bool) -> Void in
                        //code
                })
                
                
            }
            
            if messageTranslation.x > 200 {
                self.messageView.frame.origin.x = 340
                self.deleteIcon.center.x = 340
                
                UIView.animateWithDuration(0.5, delay: 0.25, options: [], animations: { () -> Void in
                    self.feedImageView.frame.origin.y = 0
                    }, completion: { (Bool) -> Void in
                        //code
                })

                
                
            }
            
            if messageTranslation.x < 0 && messageTranslation.x >= -60 {
                self.messageView.frame.origin.x = 0
            
            } else if messageTranslation.x < -60 && messageTranslation.x >= -200 {
                self.messageView.frame.origin.x = -340
                self.laterIcon.center.x = -340
                
                UIView.animateWithDuration(0.25, delay: 0.25, options: [], animations: { () -> Void in

                    self.rescheduleView.alpha = 1

                    }, completion: { (Bool) -> Void in
                        //code
                })
                

            
            } else if messageTranslation.x < -200 {
                self.messageView.frame.origin.x = -340
                self.listIcon.center.x = -340
                
                UIView.animateWithDuration(0.25, delay: 0.25, options: [], animations: { () -> Void in
                    
                    self.listView.alpha = 1

                    }, completion: { (Bool) -> Void in
                        //code
                })
                


            
            }

            
        }

    }
    
    @IBAction func dismissReschedule(sender: AnyObject) {
        
        self.rescheduleView.alpha = 0
        
        UIView.animateWithDuration(0.25, delay: 0.25, options: [], animations: { () -> Void in
            self.feedImageView.frame.origin.y = 0
                        
            }, completion: { (Bool) -> Void in
                //code
        })
    
    }
    

    @IBAction func dismissList(sender: AnyObject) {
        
        self.listView.alpha = 0
        
        UIView.animateWithDuration(0.25, delay: 0.25, options: [], animations: { () -> Void in
            self.feedImageView.frame.origin.y = 0
            
            }, completion: { (Bool) -> Void in
                //code
        })


        
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





