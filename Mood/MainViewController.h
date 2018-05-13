//
//  MainViewController.h
//  Mood
//
//  Created by Juan on 2018-05-12.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyViewController.h"

@interface MainViewController : MyViewController

@property (nonatomic, readonly) uint myReadOnlyVar;
@property (nonatomic, readonly) NSArray *moods;
@property (nonatomic, readonly) NSArray *moodColours;

- (IBAction)unwindToMain:(UIStoryboardSegue *)segue;

@end
