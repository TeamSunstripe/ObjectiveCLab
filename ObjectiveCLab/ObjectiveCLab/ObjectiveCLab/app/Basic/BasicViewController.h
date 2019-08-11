//
//  BasicViewController.h
//  ObjectiveCLab/Basic
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "MainViewController.h"
#import "CommonNavigationBar.h"

@interface BasicViewController : MainViewController<CommonNavigationBarDelegate>

@property (weak, nonatomic) IBOutlet CommonNavigationBar *commonNavigationBar;

@end
