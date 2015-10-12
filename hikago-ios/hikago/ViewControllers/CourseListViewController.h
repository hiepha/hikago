//
//  CourseListViewController.h
//  hikago
//
//  Created by ThanhDM on 10/7/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseListViewController : UITableViewController<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *courseListTable;

@end
