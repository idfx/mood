//
//  AppDelegate.h
//  Mood
//
//  Created by Juan on 2018-05-12.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property (nonatomic, readonly) NSArray *moods;

- (void)saveContext;

@end

