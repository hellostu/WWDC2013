//
//  SLTileViewController.m
//  WWDC2013
//
//  Created by Stuart Lynch on 25/04/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import "SLTileViewController.h"
#import "SLSlideShowTile.h"

#import "SLPersonalSectionViewController.h"
#import "SLAcademicSectionViewController.h"
#import "SLWorkSectionViewController.h"

typedef enum  {
    SLPersonal,
    SLAcademic,
    SLWork,
    SLNone,
} SLState;

@interface SLTileViewController ()
{
    SLSlideShowTile                 *_personalTile;
    SLSlideShowTile                 *_academicTile;
    SLSlideShowTile                 *_workTile;
    
    SLPersonalSectionViewController *_personalSection;
    SLAcademicSectionViewController *_academicSection;
    SLWorkSectionViewController     *_workSection;
    
    SLState         _state;
}

@end

@implementation SLTileViewController

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

- (void)dealloc
{
    [_personalTile release];
    [_academicTile release];
    [_workTile release];
    [_personalSection release];
    [_academicSection release];
    [_workSection release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_personalTile = [[SLSlideShowTile alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height/3)];
    [_personalTile addImage:[UIImage imageNamed:@"Stu01.jpg"]];
    [_personalTile addImage:[UIImage imageNamed:@"Stu02.jpg"]];
    [_personalTile addImage:[UIImage imageNamed:@"Stu03.jpg"]];
    [_personalTile addImage:[UIImage imageNamed:@"Stu04.jpg"]];
    _personalTile.tintColor = [UIColor colorWithRed:0.9 green:0.1 blue:0.1 alpha:0.5f];
    _personalTile.title = @"PERSONAL";
    
    _academicTile = [[SLSlideShowTile alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height/3, self.view.frame.size.width, self.view.frame.size.height/3)];
    [_academicTile addImage:[UIImage imageNamed:@"Academic01.jpg"]];
    [_academicTile addImage:[UIImage imageNamed:@"Academic02.jpg"]];
    [_academicTile addImage:[UIImage imageNamed:@"Academic03.jpg"]];
    [_academicTile addImage:[UIImage imageNamed:@"Academic04.jpg"]];
    [_academicTile addImage:[UIImage imageNamed:@"Academic05.jpg"]];
    _academicTile.tintColor = [UIColor colorWithRed:0.1 green:0.9 blue:0.1 alpha:0.5f];
    _academicTile.title = @"ACADEMIC";
    
    _workTile = [[SLSlideShowTile alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height*2/3, self.view.frame.size.width, self.view.frame.size.height/3)];
    [_workTile addImage:[UIImage imageNamed:@"Work01.jpg"]];
    [_workTile addImage:[UIImage imageNamed:@"Work02.jpg"]];
    [_workTile addImage:[UIImage imageNamed:@"Work03.jpg"]];
    [_workTile addImage:[UIImage imageNamed:@"Work04.jpg"]];
    _workTile.tintColor = [UIColor colorWithRed:0.1 green:0.1 blue:0.9 alpha:0.5f];
    _workTile.title = @"WORK";
    
    UITapGestureRecognizer *personalTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__personalTapped)];
    [_personalTile addGestureRecognizer:personalTapGesture];
    [personalTapGesture release];
    
    UITapGestureRecognizer *academicTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__academicTapped)];
    [_academicTile addGestureRecognizer:academicTapGesture];
    [academicTapGesture release];
    
    UITapGestureRecognizer *workTapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(__workTapped)];
    [_workTile addGestureRecognizer:workTapGesture];
    [workTapGesture release];
    
    _personalSection = [[SLPersonalSectionViewController alloc] init];
    [self addChildViewController:_personalSection];
    [_personalSection didMoveToParentViewController:self];
    _personalSection.view.frame = CGRectMake(0, ceilf(self.view.frame.size.height/3), self.view.frame.size.width, 0);
    
    _academicSection = [[SLAcademicSectionViewController alloc] init];
    [_academicSection didMoveToParentViewController:_academicSection];
    [self addChildViewController:_academicSection];
    _academicSection.view.frame = CGRectMake(0, ceilf(self.view.frame.size.height/3)*2, self.view.frame.size.width, 0);
    
    _workSection = [[SLWorkSectionViewController alloc] init];
    [self addChildViewController:_workSection];
    [_workSection didMoveToParentViewController:self];
    _workSection.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, 0);
    _workSection.view.backgroundColor = [UIColor blackColor];
    
    [self.view addSubview:_personalSection.view];
    [self.view addSubview:_academicSection.view];
    [self.view addSubview:_workSection.view];
    [self.view addSubview:_personalTile];
    [self.view addSubview:_academicTile];
    [self.view addSubview:_workTile];
    self.view.backgroundColor = [UIColor blackColor];
    
    _state = SLNone;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
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

- (void)__restore
{
    [UIView animateWithDuration:0.3 animations:^() {
        _personalTile.frame = CGRectMake(0, 0, self.view.frame.size.width, ceilf(self.view.frame.size.height/3));
        _academicTile.frame = CGRectMake(0, self.view.frame.size.height/3, self.view.frame.size.width, ceilf(self.view.frame.size.height/3));
        _workTile.frame = CGRectMake(0, self.view.frame.size.height*2/3, self.view.frame.size.width, ceilf(self.view.frame.size.height/3));
        
        _personalSection.view.frame = CGRectMake(0, ceilf(self.view.frame.size.height/3), self.view.frame.size.width, self.view.frame.size.height-90);
        _academicSection.view.frame = CGRectMake(0, ceilf(self.view.frame.size.height*2/3), self.view.frame.size.width, self.view.frame.size.height-90);
        _workSection.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-90);
    }];
    _state = SLNone;
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Actions
//////////////////////////////////////////////////////////////////////////

- (void)__personalTapped
{
    if (_state != SLPersonal)
    {
        [UIView animateWithDuration:0.3 animations:^() {
            _personalTile.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
            _academicTile.frame = CGRectMake(0, self.view.frame.size.height-60, self.view.frame.size.width, 30);
            _workTile.frame = CGRectMake(0,self.view.frame.size.height-30,self.view.frame.size.width, 30);
            
            _personalSection.view.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-90);
            _academicSection.view.frame = CGRectMake(0, self.view.frame.size.height-30, self.view.frame.size.width, self.view.frame.size.height-90);
            _workSection.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-90);
        }];
        _state = SLPersonal;
    }
    else
    {
        [self __restore];
    }
    
}

- (void)__academicTapped
{
    if (_state != SLAcademic)
    {
        [UIView animateWithDuration:0.3 animations:^() {
            _personalTile.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
            _academicTile.frame = CGRectMake(0, 30, self.view.frame.size.width, 30);
            _workTile.frame = CGRectMake(0,self.view.frame.size.height-30,self.view.frame.size.width, 30);
            
            _personalSection.view.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-90);
            _academicSection.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-90);
            _workSection.view.frame = CGRectMake(0, self.view.frame.size.height, self.view.frame.size.width, self.view.frame.size.height-90);
        }];
        _state = SLAcademic;
    }
    else
    {
        [self __restore];
    }
}

- (void)__workTapped
{
    if (_state != SLWork)
    {
        [UIView animateWithDuration:0.3 animations:^() {
            _personalTile.frame = CGRectMake(0, 0, self.view.frame.size.width, 30);
            _academicTile.frame = CGRectMake(0, 30, self.view.frame.size.width, 30);
            _workTile.frame = CGRectMake(0,60,self.view.frame.size.width, 30);
            
            _personalSection.view.frame = CGRectMake(0, 30, self.view.frame.size.width, self.view.frame.size.height-90);
            _academicSection.view.frame = CGRectMake(0, 60, self.view.frame.size.width, self.view.frame.size.height-90);
            _workSection.view.frame = CGRectMake(0, 90, self.view.frame.size.width, self.view.frame.size.height-90);
        }];
        _state = SLWork;
    }
    else
    {
        [self __restore];
    }
}

@end
