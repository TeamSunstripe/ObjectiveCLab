//
//  CommonViewController.m
//  ObjectiveCLab/Common/MVC/Controllers
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonViewController.h"

@interface CommonViewController ()

@end

@implementation CommonViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSStringFromClass([self class]);
    self.navigationItem.prompt = @"Team Sun Stripe";
    [self settingNavigationBar];
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

- (void)settingNavigationBar {
    if(!self.navigationController.childViewControllers){
        self.commonNavigationBar = [CommonNavigationBar settingCommonNavigationBar:self.commonNavigationBar withView:self.view];
    }
    self.commonNavigationBar.navigationTitle.title = self.title;
    self.commonNavigationBar.commonNavigationBarDelegate = self;
    self.navigationItem.leftBarButtonItem = self.commonNavigationBar.commonLeftBarButtonItem;
    self.navigationItem.rightBarButtonItem = self.commonNavigationBar.commonRightBarButtonItem;
    self.navigationItem.backBarButtonItem = self.commonNavigationBar.commonBackBarButtonItem;
    if(self.navigationController.childViewControllers){
        self.commonNavigationBar.hidden = YES;
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItems = @[self.commonNavigationBar.commonRightBarButtonItem,self.commonNavigationBar.commonLeftBarButtonItem];
    }
}

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
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"MENU" message:@"選択してください。" preferredStyle:UIAlertControllerStyleActionSheet];
    
    UIViewController *lastViewController = self.navigationController.viewControllers.lastObject.navigationController;
    UIViewController *rootViewController = self.navigationController.viewControllers.firstObject.navigationController;
    
    for (NSDictionary *item in [MainViewController mainMenuList]) {
        
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

- (void)navigation:(CommonNavigationBar *)navigationBar topButton:(UIBarButtonItem *)topButton {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}

@end

@implementation UIViewController(Common)

+ (CommonViewController *)callCommonViewController {
    CommonViewController *commonViewController = [[CommonViewController alloc] initWithNibName:@"CommonViewController" bundle:[NSBundle mainBundle]];
    return commonViewController;
}

@end

