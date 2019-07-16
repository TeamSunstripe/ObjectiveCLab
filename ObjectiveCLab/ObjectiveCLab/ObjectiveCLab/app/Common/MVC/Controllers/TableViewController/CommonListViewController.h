//
//  CommonListViewController.h
//  ObjectiveCLab/Common/MVC/Controllers
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonNavigationBar.h"
#import "MainViewController.h"

@interface CommonListViewController : UITableViewController<CommonNavigationBarDelegate>

@property (weak, nonatomic) IBOutlet UINavigationItem *tutorialNavigationItem;
@property (strong, nonatomic) IBOutlet CommonNavigationBar *commonNavigationBar;

@end
