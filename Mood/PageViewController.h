//
//  PageViewController.h
//  Mood
//
//  Created by Juan on 2018-05-13.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface PageViewController : UIPageViewController <UIPageViewControllerDataSource>

- (MyViewController *)viewControllerAtIndex:(NSUInteger)index;

@end
