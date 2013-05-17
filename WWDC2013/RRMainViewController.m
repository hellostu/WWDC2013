//
//  RRMainViewController.m
//  RailRoad
//
//
//  ==== LICENCE ====
//
// This file is part of RailRoad.
//
// RailRoad is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// RailRoad is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with RailRoad.  If not, see <http://www.gnu.org/licenses/>.
//
//  Created by Stuart Lynch on 09/02/2013.
//  Copyright (c) 2013 UEA. All rights reserved.
//

#import "RRMainViewController.h"

@interface RRMainViewController ()
{
    @private
    
    GLfloat     *_removeGamma;
    GLfloat     *_brightnessValuePtr;
}

@end

@implementation RRMainViewController

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Lifecycle
//////////////////////////////////////////////////////////////////////////

- (void)dealloc
{
    free(_removeGamma);
    [_cameraView release];
    [super dealloc];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self __initalizeLookups];
    
	_cameraView = [[RRCameraView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width,self.view.frame.size.height)];
    _cameraView.cameraCaptureSession.delegate = self;
    
    [_cameraView intializeOpenGLWithShader:@"GreyWorld"];
    [_cameraView.openGL initShaderUniform:@"Avg" ofDataType:GLSL_DATA_TYPE_VEC3];
    
    [self.view addSubview:_cameraView];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [_cameraView.cameraCaptureSession start];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [_cameraView.cameraCaptureSession stop];
}

- (void)__initalizeLookups
{
    _removeGamma = malloc(sizeof(float)*256);
    for(int i=0; i<256; i++)
    {
        _removeGamma[i] = powf(((GLfloat)i)/255.0f,2.2);
    }
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark RRCameraCaptureSessionDelegate
//////////////////////////////////////////////////////////////////////////

- (void)cameraCaptureSession:(RRCameraCaptureSession *)session capturedImage:(UIImage *)image
{
    
    void (^greyWorldBlock)(GLubyte*,size_t,size_t) = ^(GLubyte *bytes, size_t width, size_t height)
    {
        size_t numberOfPixels = width*height;
        
        double rSum = 0;
        double gSum = 0;
        double bSum = 0;
        
        for(int i=0; i<numberOfPixels; i++)
        {
            
            GLubyte r = bytes[i*4];
            GLubyte g = bytes[i*4+1];
            GLubyte b = bytes[i*4+2];
            
            rSum += _removeGamma[r];
            gSum += _removeGamma[g];
            bSum += _removeGamma[b];
        }
        
        GLfloat rAvg = rSum/(numberOfPixels);
        GLfloat gAvg = gSum/(numberOfPixels);
        GLfloat bAvg = bSum/(numberOfPixels);
        
        GLfloat mult = MIN(MIN(rAvg,gAvg),bAvg);

        GLfloat rgb[3] = {mult/rAvg,mult/gAvg,mult/bAvg};
        //NSLog(@"(%.2f,%.2f,%.2f)",rgb[0],rgb[1],rgb[2]);
        
        
        [_cameraView.openGL shaderUniform:@"Avg" setValue:rgb];
    };
    
    [_cameraView.openGL setupTextureWithImage:image processImageBytesBlock:greyWorldBlock];
    [_cameraView.openGL render];
}

//////////////////////////////////////////////////////////////////////////
#pragma mark -
#pragma mark Methods
//////////////////////////////////////////////////////////////////////////

- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
