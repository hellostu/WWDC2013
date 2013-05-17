//
//  SLSectionViewController.h
//  WWDC2013
//
//  Created by Stuart Lynch on 30/04/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLSectionViewController : UIPageViewController <UIPageViewControllerDataSource, UIPageViewControllerDelegate>
{
    @protected
    NSMutableArray  *_viewContollers;
    UIPageControl   *_pageControl;
}
@end
