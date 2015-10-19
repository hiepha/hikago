//
//  CourseDetail.h
//  hikago
//
//  Created by ThanhDM on 10/13/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CourseDetail : UIViewController<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UILabel *lbCourseName;
@property (weak, nonatomic) IBOutlet UILabel *lbAuthor;
@property (weak, nonatomic) IBOutlet UITableView *courseDetailTable;
@property (weak, nonatomic) IBOutlet UIButton *btnFlashCard;
@property (weak, nonatomic) IBOutlet UIButton *btnMatch;
@property (weak, nonatomic) IBOutlet UIButton *lbQuickCard;

- (IBAction)actSegueButtonCourse:(id)sender;


@end
