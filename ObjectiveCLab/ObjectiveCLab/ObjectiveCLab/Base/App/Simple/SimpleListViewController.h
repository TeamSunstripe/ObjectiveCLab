//
//  SimpleListViewController.h
//  ObjectiveCLab/Base/App/Simple
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "MainViewController.h"

@interface SimpleListViewController : UITableViewController {
    BOOL viewClosed;
}

@property (strong, nonatomic) NSMutableArray *itemList;
@property (strong, nonatomic) NSMutableArray *menuList;
@property (strong, nonatomic) NSString *pListFileName;
@property (strong, nonatomic) NSString *listCellName;

- (IBAction)tapMenuButton:(id)sender;

@end
