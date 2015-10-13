//
//  CourseDetail.m
//  hikago
//
//  Created by ThanhDM on 10/13/15.
//  Copyright © 2015 Thirdty-six. All rights reserved.
//

#import "CourseDetail.h"
#import "CoursesObject.h"
#import "Sentence.h"
#import "SentencyCell.h"
#import "FlashCardViewController.h"

@interface CourseDetail ()
@end

@implementation CourseDetail{
    NSArray *courseDetail;
    NSArray *sentencyArray;
    NSDictionary *sentencyDict;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //--------------------------------------------------------------------
    // read the element data from the plist
    NSString *thePath = [[NSBundle mainBundle]  pathForResource:@"CoursesDetail" ofType:@"plist"];
    courseDetail = [[NSArray alloc] initWithContentsOfFile:thePath];
    NSDictionary *courseDetailDict = [courseDetail objectAtIndex:0];
    self.lbCourseName.text = courseDetailDict[@"courseName"];
    self.lbAuthor.text = courseDetailDict[@"owner"];
    
    thePath = [[NSBundle mainBundle]  pathForResource:@"Sentency" ofType:@"plist"];
    NSArray *tempArray = [[NSArray alloc] initWithContentsOfFile:thePath];
    sentencyDict = [tempArray objectAtIndex:0];
    sentencyArray = [sentencyDict allKeys];
    NSLog(@"array of Course: %ld", (unsigned long)[courseDetail count]);
    NSLog(@"array of Sentency: %ld", (unsigned long)[sentencyDict count]);
    //--------------------------------------------------------------------
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
    return [sentencyArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *rowDict = [sentencyArray objectAtIndex:indexPath.row];
    NSString *sentency1 = (NSString*)rowDict;
    NSString *sentency2 = [sentencyDict objectForKey:rowDict];
    SentencyCell *sentencyCell = nil;
    static NSString *simpleTableIndentifier = @"SentencyCell";
    sentencyCell = (SentencyCell*)[tableView dequeueReusableCellWithIdentifier:simpleTableIndentifier];
    if(sentencyCell == nil){
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:@"SentencyCell" owner:self options:nil];
        sentencyCell = [nib objectAtIndex:0];
    }
    sentencyCell.lbSentency1.text = sentency1;
    sentencyCell.lbSentency2.text = sentency2;
    return sentencyCell;
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
}
*/

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 NSLog(@"Click on item");
 }
 */

- (IBAction)actSegueButtonCourse:(id)sender {
    FlashCardViewController *flashCard = [[FlashCardViewController alloc] initWithNibName:@"FlashCardViewController" bundle:nil];
    [self.navigationController pushViewController:flashCard animated:YES];
}
@end
