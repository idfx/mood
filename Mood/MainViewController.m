//
//  MainViewController.m
//  Mood
//
//  Created by Juan on 2018-05-12.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *moodLbl;
@property uint moodIndex;
@property AppDelegate *appDelegate;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _moodColours = @[[UIColor grayColor], [UIColor magentaColor], [UIColor yellowColor], [UIColor cyanColor], [UIColor greenColor]];
    _moodIndex = 2;
    _appDelegate = ((AppDelegate*)[[UIApplication sharedApplication] delegate]);
    
    [self.savedLabel setAlpha:0.0f];
    [self refreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)upBtnTouched:(id)sender {
    if (_moodIndex<_appDelegate.moods.count - 1){
        _moodIndex++;
        [self refreshUI];
    }
//    NSLog(@"%i",_moodIndex);
//    NSLog(@"%@", _moods);
}

- (IBAction)downBtnTouched:(id)sender {
    if (_moodIndex>0){
        _moodIndex--;
        [self refreshUI];
    }
//    NSLog(@"%i",_moodIndex);
}

- (IBAction)LongPressUp:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan){
        // Save current data point
        NSLog(@"%i",_moodIndex);
        [self SaveData];
    }
}

- (IBAction)LongPressDown:(UILongPressGestureRecognizer*)sender {
    if (sender.state == UIGestureRecognizerStateBegan){
        // Save current data point
        NSLog(@"%i",_moodIndex);
        [self SaveData];
    }
}

- (void)refreshUI {
    _moodLbl.text = _appDelegate.moods[_moodIndex];
    self.view.backgroundColor = _moodColours[_moodIndex];
}

- (void)SaveData{
    [self startFade:self];
    
    NSManagedObject *entityNameObj = [NSEntityDescription insertNewObjectForEntityForName:@"MoodEntity" inManagedObjectContext:_appDelegate.persistentContainer.viewContext];
    NSDate *now = [NSDate date];
    NSUUID *uuid = [NSUUID UUID];
    [entityNameObj setValue:now forKey:@"created"];
    [entityNameObj setValue:uuid forKey:@"id"];
    [entityNameObj setValue:now forKey:@"modified"];
    [entityNameObj setValue:[NSNumber numberWithUnsignedInteger:_moodIndex] forKey:@"moodScore"];
    
    [_appDelegate saveContext];
}

-(IBAction)startFade:(id)sender {
    [self.savedLabel setAlpha:0.0f];
    //fade in
    [UIView animateWithDuration:2.0f animations:^{
        [self.savedLabel setAlpha:1.0f];
    } completion:^(BOOL finished) {
        //fade out
        [UIView animateWithDuration:2.0f animations:^{
            [self.savedLabel setAlpha:0.0f];
        } completion:nil];
    }];
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
