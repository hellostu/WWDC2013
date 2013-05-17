//
//  SLPersonalSectionViewController.m
//  WWDC2013
//
//  Created by Stuart Lynch on 26/04/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import "SLPersonalSectionViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface SLPersonalSectionViewController ()

@end

@implementation SLPersonalSectionViewController

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
    //FIRST PAGE
	UIViewController *firstPage = [[UIViewController alloc] init];
    [self setViewControllers:@[firstPage]
                   direction:UIPageViewControllerNavigationDirectionForward
                    animated:NO
                  completion:nil];
    [_viewContollers addObject:firstPage];
    
    UIImageView *profilePic = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Stu.jpg"]];
    profilePic.contentMode = UIViewContentModeScaleAspectFill;
    profilePic.frame = CGRectMake(0, 0, 150, 150);
    profilePic.transform = CGAffineTransformMakeRotation(0.1f);
    profilePic.center = CGPointMake(160, 160);
    [firstPage.view addSubview:profilePic];
    [profilePic release];
    
    UILabel *helloLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 60)];
    helloLabel.center = CGPointMake(160, 40);
    helloLabel.backgroundColor = [UIColor clearColor];
    helloLabel.text = @"Hello, I'm Stuart :)";
    helloLabel.textColor = [UIColor whiteColor];
    helloLabel.textAlignment = NSTextAlignmentCenter;
    helloLabel.font = [UIFont systemFontOfSize:26.0f];
    [firstPage.view addSubview:helloLabel];
    [helloLabel release];
    
    [firstPage release];
    
    //SECOND PAGE
    UIViewController *secondPage = [[UIViewController alloc] init];
    [_viewContollers addObject:secondPage];
    
    UILabel *skillsLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    skillsLabel.font = [UIFont boldSystemFontOfSize:25.0f];
    skillsLabel.text = @"SKILLS";
    skillsLabel.textColor = [UIColor whiteColor];
    skillsLabel.textAlignment = NSTextAlignmentCenter;
    skillsLabel.backgroundColor = [UIColor blackColor];
    [secondPage.view addSubview:skillsLabel];
    [skillsLabel release];
    
    UITextView *skillsTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, 320, 300)];
    skillsTextView.textColor = [UIColor whiteColor];
    skillsTextView.backgroundColor = [UIColor clearColor];
    skillsTextView.text = @"I have a degree in Computing Science.\n\nI am confident programmer in Objective C, C++ and C. I learnt to code for iPhone 4 years ago because I wanted to start writing games for iPhone. I taught myself from 3 Apress textbooks.\n\nI first started to build a card based game called towers with a friend from school. A screen shot of it is on the next screen.";
    skillsTextView.font = [UIFont systemFontOfSize:16.0f];
    skillsTextView.userInteractionEnabled = NO;
    [secondPage.view addSubview:skillsTextView];
    [skillsTextView release];
    
    UIImageView *rightArrow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"swipe.png"]];
    rightArrow.center = CGPointMake(160, 310);
    [secondPage.view addSubview:rightArrow];
    [rightArrow release];
    
    [secondPage release];
    
    //THIRD PAGE
    UIViewController *thirdPage = [[UIViewController alloc] init];
    [_viewContollers addObject:thirdPage];
    
    UIImageView *towers = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Towers.jpg"]];
    towers.autoresizingMask = UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    towers.center = CGPointMake(160, 185);
    [thirdPage.view addSubview:towers];
    [towers release];
    
    [thirdPage release];
    
    //FOURTH PAGE
    UIViewController *fourthPage = [[UIViewController alloc] init];
    [_viewContollers addObject:fourthPage];
    
    UILabel *railroadLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
    railroadLabel.font = [UIFont boldSystemFontOfSize:25.0f];
    railroadLabel.text = @"RAILROAD";
    railroadLabel.textColor = [UIColor whiteColor];
    railroadLabel.textAlignment = NSTextAlignmentCenter;
    railroadLabel.backgroundColor = [UIColor blackColor];
    railroadLabel.layer.affineTransform = CGAffineTransformMakeRotation(-0.1);
    [fourthPage.view addSubview:railroadLabel];
    [railroadLabel release];
    
    UITextView *railroadTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, 320, 300)];
    railroadTextView.textColor = [UIColor whiteColor];
    railroadTextView.backgroundColor = [UIColor clearColor];
    railroadTextView.text = @"From my degree and having an interest in games I have learnt OpenGL. I recently wrote a library to help people do image processing on the iPhone using OpenGL ES 2.0.\n\nI have used this for the demo in the 'Academic' section.\n\nCheck out the github page at https://github.com/studomonly/railroad. Or:";
    railroadTextView.font = [UIFont systemFontOfSize:16.0f];
    railroadTextView.userInteractionEnabled = NO;
    [fourthPage.view addSubview:railroadTextView];
    [railroadTextView release];
    
    UIButton *tapHere = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    tapHere.frame = CGRectMake(0, 0, 300, 30);
    tapHere.center = CGPointMake(160, 310);
    [tapHere setTitle:@"Tap Here" forState:UIControlStateNormal];
    [tapHere addTarget:self action:@selector(__linkToRailroad) forControlEvents:UIControlEventTouchUpInside];
    [fourthPage.view addSubview:tapHere];
    
    [fourthPage release];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    [super dealloc];
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Methods
//////////////////////////////////////////////////////////////////////////

- (void)__linkToRailroad
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://github.com/studomonly/railroad"]];
}

@end
