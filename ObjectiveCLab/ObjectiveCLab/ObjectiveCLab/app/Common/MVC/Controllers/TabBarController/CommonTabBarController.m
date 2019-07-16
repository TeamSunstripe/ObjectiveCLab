//
//  CommonTabBarController.m
//  ObjectiveCLab/Common/MVC/Controllers
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonTabBarController.h"

@interface CommonTabBarController ()

@end

@implementation CommonTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = NSStringFromClass([self class]);
    self.navigationItem.prompt = @"Team Sun Stripe";
    
    if (self.navigationController) {
        
    } else {
        
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self promp];

    if(!self.tabBarController.viewControllers) {
        NSLog(@"コントローラーがセットされていません");
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:self.title message:@"コントローラーがセットされていません" preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"コントローラーをセットする" style: UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"コントローラーをセットしましょう");
            [self firstRootViewController];

        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"確認" style: UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"コントローラーをそのまま表示しました");
            
            [self settingNavigationBar];
            
        }]];
        [alertController addAction:[UIAlertAction actionWithTitle:@"閉じる" style: UIAlertActionStyleDestructive handler:^(UIAlertAction * _Nonnull action) {
            [self dismissViewControllerAnimated:YES completion:nil];
        }]];
        [self presentViewController:alertController animated:YES completion:nil];
        return;
    }
    
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

- (void)firstRootViewController {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    UIViewController *viewController = [storyboard instantiateInitialViewController];
    
    [self setViewControllers:@[viewController] animated:YES];
    
    [self settingNavigationBar];
    
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
