//
//  CanvasViewController.m
//  cancaslab
//
//  Created by Amit Agarwal on 9/17/15.
//  Copyright © 2015 Amit Agarwal. All rights reserved.
//

#import "CanvasViewController.h"

@interface CanvasViewController ()

@end

@implementation CanvasViewController

- (void)viewDidLoad {
    self.trayOpenPositionY = -187;
    self.trayClosePositionY = 187;
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onTrayPanGesture:(UIPanGestureRecognizer *)sender {
//    NSLog(@"panning the tray, %ld", (long)self.panGestureRecognizer.state);
    
    
    CGPoint point = [sender translationInView:self.trayView];
    
    if (self.panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Gesture began at: %f, %f", point.x, point.y);
        self.trayOriginalCenter = self.trayView.center;
    } else if (self.panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        self.trayView.center = CGPointMake(self.trayOriginalCenter.x, self.trayOriginalCenter.y + point.y);
    } else if (self.panGestureRecognizer.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended at: %f, %f", point.x, point.y);
        CGPoint velocity = [sender velocityInView:self.trayView];
        float newY = 0;
        if (velocity.y > 0) { // Going down
            newY = self.trayOriginalCenter.y + self.trayClosePositionY;
            

        } else { // Going up
            newY = self.trayOriginalCenter.y + self.trayOpenPositionY;
        }
        
        [UIView animateWithDuration:1 delay:0
             usingSpringWithDamping:0.2 initialSpringVelocity:0.0f
                            options:0 animations:^{
                                self.trayView.center = CGPointMake(self.trayOriginalCenter.x, newY);
                                [self.trayView layoutIfNeeded];
                            } completion:nil];
    }
}

- (IBAction)onFacePanGesture:(UIPanGestureRecognizer *)sender {
    NSLog(@"state: %ld", sender.state);
        CGPoint point = [sender translationInView:self.trayView];
    
    if (sender.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Gesture began");

        UIImageView *imageView = (UIImageView *)sender.view;
        self.newlyCreatedFace = [[UIImageView alloc] initWithImage:imageView.image];
        [_whiteView addSubview:_newlyCreatedFace];
        self.newlyCreatedFace.center = CGPointMake(imageView.center.x, imageView.center.y + self.trayView.frame.origin.y);
                self.faceOrigininalCenter = self.newlyCreatedFace.center;
    } else if (sender.state == UIGestureRecognizerStateChanged) {
                NSLog(@"Gesture changed");
                self.newlyCreatedFace.center = CGPointMake(self.faceOrigininalCenter.x + point.x, self.faceOrigininalCenter.y + point.y);
    } else if (sender.state == UIGestureRecognizerStateEnded) {
        NSLog(@"Gesture ended");

        self.newlyCreatedFace.center = CGPointMake(self.faceOrigininalCenter.x + point.x, self.faceOrigininalCenter.y + point.y);

    }

}
@end
