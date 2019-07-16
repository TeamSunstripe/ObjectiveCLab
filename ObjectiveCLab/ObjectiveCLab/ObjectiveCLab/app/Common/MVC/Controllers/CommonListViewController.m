//
//  CommonListViewController.m
//  ObjectiveCLab/Common/MVC/Controllers
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonListViewController.h"

@interface CommonListViewController ()

@end

@implementation CommonListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
    self.navigationItem.prompt = @"Team Sun Stripe";
    if (self.navigationController) {
        
    } else {
        
    }
    [self settingNavigationBar];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)settingNavigationBar {
    
    if(!self.navigationController.childViewControllers){
        
    } else {
        
    }
    self.commonNavigationBar = [CommonNavigationBar settingCommonNavigationBar:self.commonNavigationBar withView:self.view];
    
    self.commonNavigationBar.navigationTitle.title = self.title;
    self.commonNavigationBar.commonNavigationBarDelegate = self;
    self.navigationItem.leftBarButtonItem = self.commonNavigationBar.commonLeftBarButtonItem;
    self.navigationItem.rightBarButtonItem = self.commonNavigationBar.commonRightBarButtonItem;
    self.navigationItem.backBarButtonItem = self.commonNavigationBar.commonBackBarButtonItem;
    
    if(self.navigationController.childViewControllers){
        self.commonNavigationBar.commonNavigationBarDelegate = self;
        self.commonNavigationBar.hidden = YES;
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItems = @[self.commonNavigationBar.commonRightBarButtonItem,self.commonNavigationBar.commonLeftBarButtonItem];
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self promp];
}

- (void)promp {
    [self performSelector:@selector(animationPrompt:) withObject:@YES afterDelay:0.3];
}

- (void)animationPrompt:(BOOL)animated {
    self.navigationItem.prompt = titleCommon;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Incomplete implementation, return the number of sections
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of rows
    return 0;
}

/*
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:<#@"reuseIdentifier"#> forIndexPath:indexPath];
    
    // Configure the cell...
    
    return cell;
}
*/

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

#pragma mark - CommonNavigationBarDelegate

- (void)navigation:(CommonNavigationBar *)navigationBar backButton:(UIBarButtonItem *)backButton {
    
}

- (void)navigation:(CommonNavigationBar *)navigationBar menuButton:(UIBarButtonItem *)menuButton {
    
}

- (void)navigation:(CommonNavigationBar *)navigationBar topButton:(UIBarButtonItem *)topButton {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
