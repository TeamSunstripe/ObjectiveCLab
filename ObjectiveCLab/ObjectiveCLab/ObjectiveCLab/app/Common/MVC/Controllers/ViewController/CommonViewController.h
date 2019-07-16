//
//  CommonViewController.h
//  ObjectiveCLab/Common/MVC/Controllers
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommonNavigationBar.h"
#import "CommonLabel.h"
#import "MainViewController.h"

@interface CommonViewController : UIViewController<CommonNavigationBarDelegate>

@property (weak, nonatomic) IBOutlet CommonNavigationBar *commonNavigationBar;

@property (weak, nonatomic) IBOutlet CommonLabel *footerTitleLabel;

@end

@interface UIViewController(Common)

+ (CommonViewController *)callCommonViewController;

@end
