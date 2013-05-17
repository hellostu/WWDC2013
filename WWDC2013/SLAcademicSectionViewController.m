//
//  SLAcademicSectionViewController.m
//  WWDC2013
//
//  Created by Stuart Lynch on 30/04/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import "SLAcademicSectionViewController.h"
#import <QuartzCore/QuartzCore.h>
#import "RRMainViewController.h"

@interface SLAcademicSectionViewController ()

@end

@implementation SLAcademicSectionViewController

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
//////////////////////////////////////////////////////////////////////////

- (id)init
{
    if ( (self = [super init]) != nil)
    {
        
    }
    return self;
}

- (void)viewDidLoad
{
	self.view.backgroundColor = [UIColor blackColor];
    
    //FIRST PAGE
	UIViewController *firstPage = [[UIViewController alloc] init];
    [self setViewControllers:@[firstPage]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
    [_viewContollers addObject:firstPage];
    
    UIImageView *UEAImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"UEA.jpg"]];
    UEAImage.frame = CGRectMake(0, 18, 320, 80);
    UEAImage.contentMode = UIViewContentModeScaleAspectFill;
    [firstPage.view addSubview:UEAImage];
    [UEAImage release];
    
    UILabel *UEALabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 74, 100, 36)];
    UEALabel.font = [UIFont boldSystemFontOfSize:40];
    UEALabel.textColor = [UIColor whiteColor];
    UEALabel.backgroundColor = [UIColor clearColor];
    UEALabel.text = @"UEA";
    [firstPage.view addSubview:UEALabel];
    [UEALabel release];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(0, 115, 320, 250)];
    textView.textColor = [UIColor whiteColor];
    textView.backgroundColor = [UIColor clearColor];
    textView.text = @"I am a PhD student at the University of East Anglia in Norwich, England. \n\nI also did my Undergraduate degree here in Computing Science. \n\nMy research is in the field of Colour Science, specifically in Colour Constancy.\n\nAt the end of this section there is a DEMO using the iPhone camera!";
    textView.font = [UIFont systemFontOfSize:16.0f];
    textView.userInteractionEnabled = NO;
    [firstPage.view addSubview:textView];
    [textView release];
    
    [firstPage release];
    
    //SECOND PAGE
    UIViewController *secondPage = [[UIViewController alloc] init];
    [_viewContollers addObject:secondPage];
    
    UIImage *bananaImage = [UIImage imageNamed:@"bananas.jpg"];
    UIImageView *bananas = [[UIImageView alloc] initWithImage:bananaImage];
    bananas.frame = CGRectMake(0, 0, 320, 110);
    [secondPage.view addSubview:bananas];
    
    UILabel *colourConstancyLabel = [[UILabel alloc] initWithFrame:CGRectMake(5, 110, 320, 30)];
    colourConstancyLabel.text = @"Colour Constancy";
    colourConstancyLabel.textColor = [UIColor whiteColor];
    colourConstancyLabel.backgroundColor = [UIColor blackColor];
    colourConstancyLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    [secondPage.view addSubview:colourConstancyLabel];
    
    UITextView *colourConstancyTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 130, 320, 250)];
    colourConstancyTextView.textColor = [UIColor whiteColor];
    colourConstancyTextView.backgroundColor = [UIColor clearColor];
    colourConstancyTextView.text = @"A ripe and an unripe banana could trigger the same response in a camera under two different lights. Above, the left image is rendered under white light (sunlight), the image on the right is rendered under blue light (shadow).\n\nColour constancy is the ability to understand surface colours independent of varying light colour.";
    colourConstancyTextView.font = [UIFont systemFontOfSize:16.0f];
    colourConstancyTextView.userInteractionEnabled = NO;
    [secondPage.view addSubview:colourConstancyTextView];
    [colourConstancyTextView release];
    
    [secondPage release];
    
    //THIRD PAGE
    UIViewController *thirdPage = [[UIViewController alloc] init];
    [_viewContollers addObject:thirdPage];
    
    UILabel *whyLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,10,310,30)];
    whyLabel.backgroundColor = [UIColor clearColor];
    whyLabel.textColor = [UIColor whiteColor];
    whyLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    whyLabel.text = @"Why is this important?";
    whyLabel.textAlignment = NSTextAlignmentCenter;
    whyLabel.layer.affineTransform = CGAffineTransformMakeRotation(-0.1);
    [thirdPage.view addSubview:whyLabel];
    
    UITextView *whyTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 50, 320, 250)];
    whyTextView.textColor = [UIColor whiteColor];
    whyTextView.backgroundColor = [UIColor clearColor];
    whyTextView.text = @"Imagine you wanted to build a robot which could detect whether a banana is unripe. \n\nYou tell it what pixel colours are green. \n\nYou let it roam free in the world. \n\nHowever different lighting conditions mean it's selecting ripe\nbananas by mistake \nregularly!";
    whyTextView.font = [UIFont systemFontOfSize:16.0f];
    whyTextView.userInteractionEnabled = NO;
    [thirdPage.view addSubview:whyTextView];
    [whyTextView release];
    
    UIImageView *robot = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Robot.png"]];
    robot.center = CGPointMake(260, 300);
    [thirdPage.view addSubview:robot];
    [robot release];
    
    [thirdPage release];
    
    //FOURTH PAGE
    UIViewController *fourthPage = [[UIViewController alloc] init];
    [_viewContollers addObject:fourthPage];
    
    UILabel *solutionLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,10,310,30)];
    solutionLabel.backgroundColor = [UIColor clearColor];
    solutionLabel.textColor = [UIColor whiteColor];
    solutionLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    solutionLabel.text = @"The light in a picture";
    solutionLabel.textAlignment = NSTextAlignmentCenter;
    solutionLabel.layer.affineTransform = CGAffineTransformMakeRotation(0.1);
    [fourthPage.view addSubview:solutionLabel];
    
    UITextView *solutionTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 45, 320, 300)];
    solutionTextView.textColor = [UIColor whiteColor];
    solutionTextView.backgroundColor = [UIColor clearColor];
    solutionTextView.text = @"In the general case, we want to know the light colour of any image.\n\nOne of the simplest algorithms says the average pixel colour in an image is the light colour. This fails in a lot of cases. \n\nIf we know the light colour, we can discount it and render the image as if the light colour was white.";
    solutionTextView.font = [UIFont systemFontOfSize:16.0f];
    solutionTextView.userInteractionEnabled = NO;
    [fourthPage.view addSubview:solutionTextView];
    [solutionTextView release];
    
    UIImageView *whiteBalance = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WhiteBalance.jpg"]];
    whiteBalance.frame = CGRectMake(0, 265, 320, 95);
    [fourthPage.view addSubview:whiteBalance];
    
    [fourthPage release];
    
    //FIFTH PAGE
    UIViewController *fifthPage = [[UIViewController alloc] init];
    [_viewContollers addObject:fifthPage];
    
    UILabel *demoLabel = [[UILabel alloc] initWithFrame:CGRectMake(5,10,310,30)];
    demoLabel.backgroundColor = [UIColor clearColor];
    demoLabel.textColor = [UIColor whiteColor];
    demoLabel.font = [UIFont boldSystemFontOfSize:20.0f];
    demoLabel.text = @"DEMO";
    demoLabel.textAlignment = NSTextAlignmentCenter;
    [fifthPage.view addSubview:demoLabel];
    
    UIButton *launchDemo = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    launchDemo.frame = CGRectMake(0, 0, 300, 40);
    launchDemo.center = CGPointMake(160, 320);
    [launchDemo setTitle:@"Launch Demo" forState:UIControlStateNormal];
    [launchDemo addTarget:self action:@selector(__showCameraView) forControlEvents:UIControlEventTouchUpInside];
    [fifthPage.view addSubview:launchDemo];
    
    UITextView *demoTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, 320, 300)];
    demoTextView.textColor = [UIColor whiteColor];
    demoTextView.backgroundColor = [UIColor clearColor];
    demoTextView.text = @"In this demo, the light is going to be estimated for each frame from the camera. The light is assumed to be the average pixel. The frame is then 'corrected' by the light estimate.\n\nWhen it gets it wrong, the colours will look strange.\n\nPlace a brightly coloured object in front of the camera, you'll notice the colours in the background will change. ";
    demoTextView.font = [UIFont systemFontOfSize:16.0f];
    demoTextView.userInteractionEnabled = NO;
    [fifthPage.view addSubview:demoTextView];
    [demoTextView release];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)__showCameraView
{
    RRMainViewController *rrCameraSession = [[RRMainViewController alloc] init];
    UIButton *close = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    close.frame = CGRectMake(10, 10, 20, 20);
    [close setTitle:@"X" forState:UIControlStateNormal];
    [close addTarget:rrCameraSession action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
    [rrCameraSession.view addSubview:close];
    
    [self.parentViewController presentViewController:rrCameraSession animated:YES completion:nil];
    [rrCameraSession release];
}

@end
