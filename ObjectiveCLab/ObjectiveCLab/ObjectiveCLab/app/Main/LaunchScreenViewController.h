//
//  LaunchScreenViewController.h
//  ObjectiveCLab
//
//  Created by YouOhshima on 2019/07/06.
//  Copyright © 2019年 Ohshima You. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainViewController.h"

@interface LaunchScreenViewController : UIViewController

@end

@interface UIStoryboard (Utils)

extern const NSString *Main_storyboard;

+ (UIStoryboard *)shared;

/// 遷移先のLaunchScreenViewControllerをStoryBoardをもとに作成
- (LaunchScreenViewController *)launchScreenViewController;
/// 遷移先のMainViewControllerをStoryBoardをもとに作成
- (MainViewController *)mainViewController;

@end
