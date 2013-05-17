//
//  SLSectionViewController.m
//  WWDC2013
//
//  Created by Stuart Lynch on 30/04/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import "SLSectionViewController.h"

@interface SLSectionViewController ()

@end

@implementation SLSectionViewController

- (id)init
{
    if ( (self = [super initWithTransitionStyle:UIPageViewControllerTransitionStyleScroll navigationOrientation:UIPageViewControllerNavigationOrientationHorizontal options:nil]) != nil)
    {
        _viewContollers = [[NSMutableArray alloc] init];
        self.dataSource = self;
        self.delegate = self;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	self.view.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height-20, self.view.frame.size.width, 20)];
    _pageControl.autoresizingMask = UIViewAutoresizingFlexibleTopMargin;
    _pageControl.numberOfPages = [_viewContollers count];
    _pageControl.currentPage = 0;
    _pageControl.userInteractionEnabled = NO;
    [self.view addSubview:_pageControl];
    [_pageControl release];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIPageViewControllerDelegate
//////////////////////////////////////////////////////////////////////////

- (void)pageViewController:(UIPageViewController *)pageViewController willTransitionToViewControllers:(NSArray *)pendingViewControllers
{
    _pageControl.numberOfPages = [_viewContollers count];
    _pageControl.currentPage = [_viewContollers indexOfObject:pendingViewControllers[0]];
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark UIPageViewControllerDataSource
//////////////////////////////////////////////////////////////////////////

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    int currentViewControllerIndex = [_viewContollers indexOfObject:viewController];
    
    if (currentViewControllerIndex-1 < 0)
    {
        return nil;
    }
    else
    {
        currentViewControllerIndex--;
        return _viewContollers[currentViewControllerIndex];
    }
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    int currentViewControllerIndex = [_viewContollers indexOfObject:viewController];
    if (currentViewControllerIndex+1 >= [_viewContollers count])
    {
        return nil;
    }
    else
    {
        currentViewControllerIndex++;
        return _viewContollers[currentViewControllerIndex];
    }
}

@end
