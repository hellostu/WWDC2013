//
//  SLWorkSectionViewController.m
//  WWDC2013
//
//  Created by Stuart Lynch on 01/05/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import "SLWorkSectionViewController.h"
#import <MediaPlayer/MediaPlayer.h>

@interface SLWorkSectionViewController ()

@end

@implementation SLWorkSectionViewController

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
    
    UIImageView *appleLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"Apple.jpg"]];
    appleLogo.center = CGPointMake(160, 55);
    [firstPage.view addSubview:appleLogo];
    [appleLogo release];
    
    UITextView *appleTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 100, 320, 200)];
    appleTextView.textColor = [UIColor whiteColor];
    appleTextView.backgroundColor = [UIColor clearColor];
    appleTextView.text = @"For the last 2 summers I have interned at Apple's headquarters in California. \n\nIn the first internship (2011) I worked on a research project for the Aperture team.\n\nDuring the second internship (2012) I built a prototype iPhone app for the consumer apps team.";
    appleTextView.font = [UIFont systemFontOfSize:16.0f];
    appleTextView.userInteractionEnabled = NO;
    [firstPage.view addSubview:appleTextView];
    [appleTextView release];
    
    
    [firstPage release];
    
    //SECOND PAGE
    UIViewController *secondPage = [[UIViewController alloc] init];
    [_viewContollers addObject:secondPage];
    
    UIImageView *mixcloudLogo = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mixcloudLogo.png"]];
    mixcloudLogo.center = CGPointMake(160, 35);
    [secondPage.view addSubview:mixcloudLogo];
    
    UIButton *mixcloudVideoButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [mixcloudVideoButton setTitle:@"Mixcloud App Demo" forState:UIControlStateNormal];
    mixcloudVideoButton.frame = CGRectMake(0, 0, 300, 40);
    mixcloudVideoButton.center = CGPointMake(160,320);
    [mixcloudVideoButton addTarget:self
                            action:@selector(__playMixcloudMovie)
                  forControlEvents:UIControlEventTouchUpInside];
    [secondPage.view addSubview:mixcloudVideoButton];
    
    UITextView *mixcloudTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 80, 320, 200)];
    mixcloudTextView.textColor = [UIColor whiteColor];
    mixcloudTextView.backgroundColor = [UIColor clearColor];
    mixcloudTextView.text = @"Since December 2012 I have been an iOS Developer at Mixcloud, London part-time. \n\nWorking closely with their team of designers and developers, I have built their new app.\n\nThe app includes a player which can be dragged up from the tab bar.";
    mixcloudTextView.font = [UIFont systemFontOfSize:16.0f];
    mixcloudTextView.userInteractionEnabled = NO;
    [secondPage.view addSubview:mixcloudTextView];
    [mixcloudTextView release];
    
    [secondPage release];
    
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Methods
//////////////////////////////////////////////////////////////////////////

- (void)__playMixcloudMovie
{
    
    NSURL* url = [[NSBundle mainBundle] URLForResource:@"Mixcloud" withExtension:@"mp4"];
    MPMoviePlayerViewController *moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:url];
    moviePlayer.moviePlayer.controlStyle = MPMovieControlStyleFullscreen;
    [moviePlayer.moviePlayer play];
    [self.parentViewController presentViewController:moviePlayer animated:YES completion:nil];
    [moviePlayer release];
}

@end
