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
    
    
    CGPoint point = [self.panGestureRecognizer translationInView:self.trayView];
    
    if (self.panGestureRecognizer.state == UIGestureRecognizerStateBegan) {
        NSLog(@"Gesture began at: %f, %f", point.x, point.y);
        self.trayOriginalCenter = self.trayView.center;
    } else if (self.panGestureRecognizer.state == UIGestureRecognizerStateChanged) {
        NSLog(@"Gesture changed at: \(point)");
        self.trayView.center = CGPointMake(self.trayOriginalCenter.x, self.trayOriginalCenter.y + point.y);
    } else if (self.panGestureRecognizer.state == UIGestureRecognizerStateEnde  d) {
        NSLog(@"Gesture ended at: \(point)");
    }
    
    /*
    var point = self.panGestureRecognizer.locationInView(view)
    var velocity = panGestureRecognizer.velocityInView(view)
    
    if panGestureRecognizer.state == UIGestureRecognizerState.Began {
        println("Gesture began at: \(point)")
    } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
        println("Gesture changed at: \(point)")
    } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
        println("Gesture ended at: \(point)")
    }
     */
}
@end
