//
//  SimpleListViewController.m
//  ObjectiveCLab/Base/App/Simple
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "SimpleListViewController.h"

@interface SimpleListViewController ()

@end

@implementation SimpleListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        
    if (!_pListFileName || [_pListFileName isEqualToString:@""]) {
        viewClosed = YES;
        return;
    }
    
    viewClosed = NO;
    // 初期化
    _itemList = [NSMutableArray new];
    _itemList = [[NSArray getPropertyListWithIndex:-1 withFileName:self.pListFileName] mutableCopy];
    
    _menuList = [[MainViewController mainMenuList] mutableCopy];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - @IBAction

- (IBAction)tapTopButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapMenuButton:(id)sender {
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"MENU" message:@"選択してください。" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIViewController *lastViewController = self.navigationController.viewControllers.lastObject.navigationController;
    UIViewController *rootViewController = self.navigationController.viewControllers.firstObject.navigationController;
    
    for (NSDictionary *item in _menuList) {
        
        UIStoryboard *storyboard = [UIStoryboard storyboardWithName:item[@"storyboardName"] bundle:[NSBundle mainBundle]];
        __kindof UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:item[@"viewControllerName"]];
        // 現在のビューコントローラーの場合非表示にする
        BOOL isEnabled = (![lastViewController.restorationIdentifier isEqualToString:viewController.restorationIdentifier]);
        UIAlertAction *action = [UIAlertAction actionWithTitle:item[@"title"] style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            
            [self.navigationController popToRootViewControllerAnimated:YES];
            if (isEnabled) {
                [rootViewController presentViewController:viewController animated:YES completion:^{
                    //
                }];
            }
            
        }];
        action.enabled = isEnabled;
        [alertController addAction:action];

    }
    
    [self presentViewController:alertController animated:YES completion:nil];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // #warning Incomplete implementation, return the number of sections
    return [_itemList count];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // #warning Incomplete implementation, return the number of rows
    NSArray *itmes = _itemList[section][PListItems];
    return [itmes count];
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    NSString *headerTitle = _itemList[section][PListHeader][PListTitle];
    if (!headerTitle) {
        return @"";
    }
    return headerTitle;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:self.listCellName forIndexPath:indexPath];
    // Configure the cell...
    NSArray *itmes = _itemList[indexPath.section][PListItems];
    if (itmes) {
        cell.textLabel.text = itmes[indexPath.row][PListTitle];
    }
    
    return cell;
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

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *itmes = _itemList[indexPath.section][PListItems];
    if (itmes) {
        NSString *URLString = itmes[indexPath.row][PListURL];
        if (URLString || ![URLString isEqualToString:@""]) {
            NSURL *openURL = [NSURL URLWithString:URLString];
            if (@available(iOS 10.0, *)) {
                [[UIApplication sharedApplication] openURL:openURL
                                                   options:@{}
                                         completionHandler:nil];
            } else {
                // Fallback on earlier versions
                [[UIApplication sharedApplication] openURL:openURL];
            }
            
        }
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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
