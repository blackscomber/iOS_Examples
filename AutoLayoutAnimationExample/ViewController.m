//
//  ViewController.m
//  AutoLayoutAnimationExample
//
//  Created by claire lee on 1/1/16.
//  Copyright © 2016 claire lee. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *saveAlertVeiwTopConstrint;
@property (weak, nonatomic) IBOutlet UIView *topBar;
@property (weak, nonatomic) IBOutlet UIView *saveAlertView;
@property (weak, nonatomic) IBOutlet UILabel *saveAlertLabel;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;
@property BOOL isSaveAlertViewExpanded;
@property (strong, nonatomic) IBOutlet UIView *view;

@end

@implementation ViewController
- (IBAction)saveButtonTapped:(id)sender {
   // self.isSaveAlertViewExpanded = !_isSaveAlertViewExpanded;

    //Animation
    [UIView animateWithDuration:0.5 delay:0.0 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseIn animations:^{

        self.saveAlertView.alpha = 1;
        self.saveAlertVeiwTopConstrint.constant = 44;
        [self.view layoutIfNeeded];

        [UIView setAnimationDelegate:self];
        [UIView setAnimationDidStopSelector:@selector(moveToTop:finished:context:)];

    } completion:^(BOOL finished)
     {

     }];
}

- (void)moveToTop:(NSString*)animationID finished:(NSNumber*)finished context:(void*)context {

    [UIView animateWithDuration:1 delay:1 usingSpringWithDamping:1 initialSpringVelocity:1 options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.saveAlertVeiwTopConstrint.constant = -44;
        self.saveAlertView.alpha = 0;
        [self.view layoutIfNeeded];

    } completion:^(BOOL finished)
     {
     }];
}

- (void) configureUI {
    _topBar.backgroundColor = [UIColor colorWithRed:0.925 green:0.918 blue:0.922 alpha:1];
    _saveAlertLabel.backgroundColor = [UIColor colorWithRed:0.392 green:0.392 blue:0.392 alpha:1];
    self.view.backgroundColor = [UIColor whiteColor
                                 ];
    _saveAlertLabel.text = @"Happy New Year!";
    [_saveButton setTitleColor:[UIColor blackColor]
                      forState:UIControlStateNormal];

    self.saveAlertVeiwTopConstrint.constant = -44;
    self.saveAlertView.alpha = 0;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

   // _isSaveAlertViewExpanded = false;
    [self configureUI];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
