//
//  ViewController.m
//  GestureTest
//
//  Created by David Kapp on 2/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

#define kImageOriginX 94.0
#define kImageOriginY 330.0
#define kImageWidth 132.0
#define kImageHeight 117.0

@implementation ViewController
@synthesize outputLabel;
@synthesize imageView;

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [self setOutputLabel:nil];
  [self setImageView:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }
}

- (IBAction)wasTapped:(id)sender {
  UITapGestureRecognizer *recognizer = (UITapGestureRecognizer*)sender;
  CGPoint location = [recognizer locationInView:[recognizer view]];
  self.outputLabel.text = [NSString stringWithFormat:@"Tapped @ [%f, %f]!", location.x, location.y];
}

- (IBAction)wasSwiped:(id)sender {
  self.outputLabel.text = @"Swiped!";
}

- (IBAction)wasPinched:(id)sender {
  UIPinchGestureRecognizer *recognizer = (UIPinchGestureRecognizer*)sender;
  NSString *output;
  float scale = recognizer.scale;
  self.imageView.transform = CGAffineTransformMakeRotation(0.0); // resetting rotation on zoom
  
  output = [NSString stringWithFormat:@"Pinched w/scale:%1.2f velocity:%1.2f", scale, recognizer.velocity];
  self.outputLabel.text = output;
  
  // now set the frame w/the scale to change the image size
  self.imageView.frame = CGRectMake(kImageOriginX, kImageOriginY, kImageWidth * scale, kImageHeight * scale);
}

- (IBAction)wasRotated:(id)sender {
  UIRotationGestureRecognizer *recognizer = (UIRotationGestureRecognizer*)sender;  
  float rotation = recognizer.rotation;
  
  NSString *output = [NSString stringWithFormat:@"Rotated w/radians:%1.2f, velocity:%1.2f", rotation, recognizer.velocity];
  self.outputLabel.text = output;
  
  // now do the actual rotation by setting a transform (which takes radians, so no math needed on our part
  self.imageView.transform = CGAffineTransformMakeRotation(rotation);
}

- (BOOL)canBecomeFirstResponder {
  return YES;
}

- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event {
  if (motion == UIEventSubtypeMotionShake) {
    self.outputLabel.text = @"Things are shakin' here!";
    self.imageView.transform = CGAffineTransformMakeRotation(0.0);
    self.imageView.frame = CGRectMake(kImageOriginX, kImageOriginY, kImageWidth, kImageHeight);
  }
}
@end



















