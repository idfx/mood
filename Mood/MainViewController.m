//
//  MainViewController.m
//  Mood
//
//  Created by Juan on 2018-05-12.
//  Copyright © 2018 Juan Lara. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (weak, nonatomic) IBOutlet UILabel *moodLbl;
@property uint moodIndex;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _moods = @[@":'(", @":(", @":|", @":)", @":D"];
    _moodColours = @[[UIColor grayColor], [UIColor magentaColor], [UIColor yellowColor], [UIColor cyanColor], [UIColor greenColor]];
    _moodIndex = 2;
    [self refreshUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)upBtnTouched:(id)sender {
    if (_moodIndex<_moods.count - 1){
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

- (IBAction)LongPressUp:(id)sender {
    // Save current data point
    NSLog(@"%i",_moodIndex);
}

- (IBAction)LongPressDown:(id)sender {
    // Save current data point
    NSLog(@"%i",_moodIndex);
}

- (void)refreshUI {
    _moodLbl.text = _moods[_moodIndex];
    self.view.backgroundColor = _moodColours[_moodIndex];
}

- (IBAction)unwindToMain:(UIStoryboardSegue *)segue {
    
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
