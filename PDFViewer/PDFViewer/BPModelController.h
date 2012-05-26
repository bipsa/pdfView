//
//  BPModelController.h
//  PDFViewer
//
//  Created by Sebastian Romero on 5/26/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BPDataViewController;

@interface BPModelController : NSObject <UIPageViewControllerDataSource>

- (BPDataViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(BPDataViewController *)viewController;

@end
