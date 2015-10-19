//
//  MainViewController.m
//  hikago
//
//  Created by ThanhDM on 9/29/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "MainViewController.h"
#import "CourseListViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)actStartCourse:(UIButton *)sender {
        [self.navigationController pushViewController:[[CourseListViewController alloc] init]
                                             animated:YES];
}
@end
