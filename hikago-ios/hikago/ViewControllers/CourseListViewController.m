//
//  CourseListViewController.m
//  hikago
//
//  Created by ThanhDM on 10/7/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "CourseListViewController.h"
#import "CourseListBussiness.h"
#import "CourseCell.h"
#import "CoursesObject.h"

@interface CourseListViewController ()

@end

@implementation CourseListViewController{
    CourseListBussiness *courseBussiness;
    NSArray *arrCourses;
}

@synthesize courseListTable;

- (void)viewDidLoad {
    [super viewDidLoad];
    courseBussiness = [[CourseListBussiness alloc]init];
    self.courseListTable.dataSource = self;
}

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"viewDidAppear");
    [super viewDidAppear:animated];
    [courseBussiness getCourseList:^(NSArray *arrayCourse){
        arrCourses = arrayCourse;
        [self.tableView reloadData];
    } failure:^(NSInteger errorCode, NSString *errMsg){
        // Show alert here!
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSInteger rows = [arrCourses count];
    NSLog(@"Number of rows: %ld", rows);
    return rows;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"Draw row here: index row %ld ", indexPath.row);
    NSDictionary *course = [arrCourses objectAtIndex:indexPath.row];
    if(course == nil){
        return nil;
    }
    CourseCell *courseCell = nil;
    static NSString *simpleTableIndentifier = @"CourseCell";
    courseCell = (CourseCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIndentifier];
    if(courseCell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"CourseCell" owner:self options:nil];
        courseCell = [nib objectAtIndex:0];
    }
    courseCell.lbCourseName.text = course[@"courseName"];
    courseCell.lbAuthor.text = course[@"owner"];
    courseCell.lbCreatedTime.text = course[@"createdTime"];
//    UIImage * img = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:contact.avatar]]];
//    contactCell.imgAvatar.image = img;
    return courseCell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
