//
//  SLSlideShowTile.m
//  WWDC2013
//
//  Created by Stuart Lynch on 25/04/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import "SLSlideShowTile.h"

@interface SLSlideShowTile ()
{
    @private
    UIScrollView    *_scrollView;
    NSMutableArray  *_images;
    UIView          *_tintView;
    
    UILabel         *_label;
    
    int             _lastIndex;
    CGRect          _firstFrame;
}

@end

@implementation SLSlideShowTile
@dynamic tintColor;

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
//////////////////////////////////////////////////////////////////////////

- (id)initWithFrame:(CGRect)frame
{
    
    if ((self = [super initWithFrame:frame]) != nil)
    {
        _firstFrame = frame;
        
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        _scrollView.userInteractionEnabled = NO;
        _scrollView.backgroundColor = [UIColor blackColor];
        _scrollView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _images = [[NSMutableArray alloc] initWithCapacity:3];
        _lastIndex = -1;
        
        _tintView = [[UIView alloc] initWithFrame:_scrollView.frame];
        _tintView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        
        _label = [[UILabel alloc] initWithFrame:CGRectMake(5, _scrollView.frame.size.height-30, _scrollView.frame.size.width-10, 30)];
        _label.backgroundColor = [UIColor clearColor];
        _label.textColor = [UIColor whiteColor];
        _label.textAlignment = NSTextAlignmentRight;
        _label.font = [UIFont boldSystemFontOfSize:20.0f];
        _label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin;
        
        [self addSubview:_scrollView];
        [self addSubview:_tintView];
        [self addSubview:_label];
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
    [_scrollView release];
    [_images release];
    [_tintView release];
    [_label release];
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Properties
//////////////////////////////////////////////////////////////////////////

- (void)setTintColor:(UIColor *)tintColor
{
    _tintView.backgroundColor = tintColor;
}

- (UIColor *)tintColor
{
    return _tintView.backgroundColor;
}

- (void)setTitle:(NSString *)title
{
    _label.text = title;
}

- (NSString *)title
{
    return _label.text;
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Methods
//////////////////////////////////////////////////////////////////////////

- (void)addImage:(UIImage *)image
{
    [_images addObject:image];
    if (_images.count == 1)
    {
        [self __animate];
    }
}

- (void)__animate
{
    int imageIndex = arc4random() % _images.count;
    if (_images.count > 1)
    {
        while (imageIndex == _lastIndex)
        {
            imageIndex = arc4random() % _images.count;
        }
    }
    _lastIndex = imageIndex;
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:_images[imageIndex]];
    
    CGSize minSize = [self __minSizeForImage:_images[imageIndex]];
    CGFloat scale = 1.0f+((CGFloat)(arc4random() % 5))/10.0f;
    CGSize maxSize = CGSizeMake(minSize.width*scale, minSize.height*scale);
    
    imageView.alpha = 0;
    [_scrollView addSubview:imageView];
    
    CGFloat timeInterval = 6.0f+((arc4random() % 10)/10.0f)*4.0f;
    
    [UIView animateWithDuration:2
                     animations:^() {
                         imageView.alpha = 1;
                     }];
    
    [NSTimer scheduledTimerWithTimeInterval:timeInterval-2 target:self selector:@selector(__animate) userInfo:nil repeats:NO];
    
    int zoomInOrOut = arc4random() % 2;
    if (zoomInOrOut == 1)
    {
        imageView.frame = CGRectMake(0, 0, minSize.width, minSize.height);
        imageView.center = CGPointMake(_firstFrame.size.width/2, _firstFrame.size.height/2);
        [UIView animateWithDuration:timeInterval
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^() {
                             CGRect frame = imageView.frame;
                             frame.size.width = maxSize.width;
                             frame.size.height = maxSize.height;
                             imageView.frame = frame;
                             
                             CGPoint offset = [self __randomOffsetForImageView:imageView];
                             imageView.center = CGPointMake(_firstFrame.size.width/2, _firstFrame.size.height/2);
                             CGPoint center = imageView.center;
                             center.x += offset.x;
                             center.y += offset.y;
                             imageView.center = center;
                             
                             
                         }
                         completion:^(BOOL finished) {
                             [imageView removeFromSuperview];
                         }];
    }
    else
    {
        imageView.frame = CGRectMake(0, 0, maxSize.width, maxSize.height);
        imageView.center = CGPointMake(_scrollView.frame.size.width/2, _scrollView.frame.size.height/2);
        
        CGPoint offset = [self __randomOffsetForImageView:imageView];
        CGPoint center = imageView.center;
        center.x += offset.x;
        center.y += offset.y;
        imageView.center = center;
        
        [UIView animateWithDuration:timeInterval
                              delay:0
                            options:UIViewAnimationOptionCurveLinear
                         animations:^() {
                             imageView.frame = CGRectMake(0, 0, minSize.width, minSize.height);
                             imageView.center = CGPointMake(_firstFrame.size.width/2, _firstFrame.size.height/2);
                         }
                         completion:^(BOOL finished) {
                             [imageView removeFromSuperview];
                         }];
    }
    
    
    [imageView release];
}

- (CGSize)__minSizeForImage:(UIImage *)image
{
    CGFloat width = image.size.width;
    CGFloat height = image.size.height;
    
    CGFloat ratio = _firstFrame.size.width/width;
    CGFloat newWidth = _firstFrame.size.width;
    CGFloat newHeight = height*ratio;
    if (newHeight<_firstFrame.size.height)
    {
        ratio = _scrollView.frame.size.height/height;
        newWidth = width*ratio;
        newHeight = _scrollView.frame.size.height;
    }
    return CGSizeMake(newWidth, newHeight);
}

- (CGPoint)__randomOffsetForImageView:(UIImageView *)imageView
{
    CGFloat maxWidth = (_firstFrame.size.width-imageView.frame.size.width);
    CGFloat maxHeight = (_firstFrame.size.height-imageView.frame.size.height);
    
    CGFloat rand1 = (arc4random() % 1000)/1000.0f;
    CGFloat rand2 = (arc4random() % 1000)/1000.0f;
    
    return CGPointMake(maxWidth*rand1 - maxWidth/2, maxHeight*rand2-maxHeight/2);
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
