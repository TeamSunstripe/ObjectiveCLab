//
//  LaunchScreenViewController.m
//  ObjectiveCLab
//
//  Created by YouOhshima on 2019/07/06.
//  Copyright © 2019年 Ohshima You. All rights reserved.
//

#import "LaunchScreenViewController.h"

@interface UtilStoryboard : UIStoryboard

extern const NSString *Main_storyboard;

+ (UtilStoryboard *)shared;

/// 遷移先のLaunchScreenViewControllerをStoryBoardをもとに作成
- (LaunchScreenViewController *)launchScreenViewController;
/// 遷移先のMainViewControllerをStoryBoardをもとに作成
- (MainViewController *)mainViewController;

@end

@interface UtilStoryboard ()

@end

@implementation UtilStoryboard

static UtilStoryboard *shared_ = nil;
const NSString *Main_storyboard = @"Main";

+ (UtilStoryboard *)shared{
    if (!shared_) {
        shared_ = [UtilStoryboard new];
    }
    return shared_;
}


+ (__kindof UIViewController *)viewControllerStoryboardName:(NSString *)name
                                             viewController:(id)identifier {
    NSString *sString = name;
    UIStoryboard *s = [self isExistsStoryboard:[UIStoryboard storyboardWithName:sString bundle:nil]];
    if (identifier) {
        if ([[identifier class] isKindOfClass:[NSString class]]) {
            return [self isExistsViewController:[s instantiateViewControllerWithIdentifier:identifier]];
        } else {
            return [self isExistsViewController:[s instantiateViewControllerWithIdentifier:NSStringFromClass([identifier class])]];
        }
    }
    return [self isExistsViewController:s.instantiateInitialViewController];
}

+ (__kindof UIViewController *)viewControllerStoryboardName:(NSString *)name
                                   viewControllerIdentifier:(NSString *)identifier {
    return [self viewControllerStoryboardName:name viewControllerIdentifier:identifier];
}

+ (__kindof UIViewController *)viewControllerStoryboardName:(NSString *)name{
    return [self viewControllerStoryboardName:name viewController:nil];
}


- (id)init
{
    self = [super init];
    if (self) {
        //Initialization
    }
    return self;
}

- (LaunchScreenViewController *)launchScreenViewController {
    return [UtilStoryboard viewControllerStoryboardName:(NSString *) Main_storyboard];
}

- (MainViewController *)mainViewController {
    return [UtilStoryboard viewControllerStoryboardName:(NSString *) Main_storyboard
                                         viewController:[MainViewController class]];
}

// privete
/// 存在確認 viewController
+ (nullable __kindof UIViewController *)isExistsViewController:(__kindof UIViewController *)viewController {
    if (viewController) {
        return viewController;
    }
    exit(0);
}

/// 存在確認 storyboard
+ (nullable __kindof UIStoryboard *)isExistsStoryboard:(__kindof UIStoryboard *)storyboard {
    if (storyboard) {
        return storyboard;
    }
    exit(0);
}

@end


@interface LaunchScreenViewController ()

@property (retain, nonatomic) NSTimer *timer;

@end

@implementation LaunchScreenViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _timer = [NSTimer scheduledTimerWithTimeInterval:3.0
                                                      target:self
                                                    selector:@selector(autoChangeNextViewController)
                                                    userInfo:nil
                                                     repeats:false];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)autoChangeNextViewController {
    
    MainViewController *mainViewController = UtilStoryboard.shared.mainViewController;
    if (self.navigationController) {
        // 画面をPUSHで遷移させる
        [self.navigationController pushViewController:mainViewController animated:YES];
    } else {
        [self presentViewController:mainViewController animated:YES completion:nil];
    }
}

@end
