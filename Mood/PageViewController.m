//
//  PageViewController.m
//  Mood
//
//  Created by Juan on 2018-05-13.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

//@property NSUInteger index;
@property NSArray *uiViewControllers;

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _uiViewControllers = [NSArray arrayWithObjects:
                          [self.storyboard instantiateViewControllerWithIdentifier:@"MainViewController"],
                          [self.storyboard instantiateViewControllerWithIdentifier:@"HistoricalDataTableViewController"],
                          [self.storyboard instantiateViewControllerWithIdentifier:@"InstructionsViewController"], nil];
    
    self.dataSource = self;
    
    UIViewController *initialVC = _uiViewControllers[0];
    NSArray *viewControllers = [NSArray arrayWithObject:initialVC];
    [self setViewControllers:viewControllers direction:UIPageViewControllerNavigationDirectionForward animated:NO completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerBeforeViewController: (UIViewController *)viewController{
    NSUInteger index = [_uiViewControllers indexOfObject:viewController];
    if (index == 0) {
        return nil;
    }
    index--;
    return _uiViewControllers[index];
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerAfterViewController: (UIViewController *)viewController{
    NSUInteger index = [_uiViewControllers indexOfObject:viewController];
    if (index == _uiViewControllers.count - 1) {
        return nil;
    }
    index++;
    return _uiViewControllers[index];
}

@end
