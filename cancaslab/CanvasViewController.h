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
- (IBAction)onFacePanGesture:(UIPanGestureRecognizer *)sender;
@property CGPoint trayOriginalCenter;
@property CGPoint faceOrigininalCenter;
@property float trayOpenPositionY;
@property float trayClosePositionY;
@property (weak, nonatomic) IBOutlet UIView *whiteView;
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;
@property (strong, nonatomic) UIImageView *newlyCreatedFace;
@end
