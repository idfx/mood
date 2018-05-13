//
//  MainViewController.h
//  Mood
//
//  Created by Juan on 2018-05-12.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

@property (nonatomic, readonly) uint myReadOnlyVar;
@property (nonatomic, readonly) NSArray *moodColours;
@property (weak, nonatomic) IBOutlet UILabel *savedLabel;

@end
