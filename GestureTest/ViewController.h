//
//  ViewController.h
//  GestureTest
//
//  Created by David Kapp on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *outputLabel;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)wasTapped:(id)sender;
- (IBAction)wasSwiped:(id)sender;
- (IBAction)wasPinched:(id)sender;
- (IBAction)wasRotated:(id)sender;

- (BOOL)canBecomeFirstResponder;
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event;
@end
