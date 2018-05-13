//
//  PageViewController.m
//  Mood
//
//  Created by Juan on 2018-05-13.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import "PageViewController.h"

@interface PageViewController ()

@end

@implementation PageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerBeforeViewController: (UIViewController *)viewController{
    NSUInteger index = ((MyViewController *) viewController).pageIndex;
    if (index == 0 || index == NSNotFound) {
        return nil;
    }
    index--;
    return [self viewControllerAtIndex: index];
}

- (UIViewController *)pageViewController: (UIPageViewController *)pageViewController viewControllerAfterViewController: (UIViewController *)viewController{
    NSUInteger index = ((MyViewController *) viewController).pageIndex;
    if (index == NSNotFound) {
        return nil;
    }
    index++;
//    if (index == devices.count) {
//        return nil;
//    }
    return [self viewControllerAtIndex: index];
}

// helper method
- (MyViewController *)viewControllerAtIndex:(NSUInteger)index
{
    MyViewController *vc = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
//    vc.strImage = devices[index];
    vc.pageIndex = index;
    return vc;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
