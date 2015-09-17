//
//  CanvasViewController.h
//  cancaslab
//
//  Created by Amit Agarwal on 9/17/15.
//  Copyright © 2015 Amit Agarwal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CanvasViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *trayView;
- (IBAction)onTrayPanGesture:(UIPanGestureRecognizer *)sender;
@property CGPoint trayOriginalCenter;
@property float trayOpenPositionY;
@property float trayClosePositionY;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;
@end
