//
//  SLSlideShowTile.h
//  WWDC2013
//
//  Created by Stuart Lynch on 25/04/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SLSlideShowTile : UIView
@property(nonatomic, readwrite, assign) UIColor *tintColor;
@property(nonatomic, readwrite, assign) NSString *title;

- (void)addImage:(UIImage *)image;

@end
