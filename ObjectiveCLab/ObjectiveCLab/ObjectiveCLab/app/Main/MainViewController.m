//
//  MainViewController.m
//  ObjectiveCLab/Main
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

NSString *const titleTutorial = @"チュートリアル";
NSString *const englishTutorial = @"Tutorial";
NSString *const titleTutorialListViewController = @"TutorialListViewController";
NSString *const titleTutorialListNavigationController = @"TutorialListNavigationController";

NSString *const titleBasic = @"基礎編";
NSString *const englishBasic = @"Basic";
NSString *const titleBasicViewController = @"BasicViewController";
NSString *const titleBasicNavigationController = @"BasicNavigationController";

NSString *const titleExpansion = @"応用編";
NSString *const englishExpansion = @"Expansion";
NSString *const titleExpansionViewController = @"ExpansionViewController";
NSString *const titleExpansionNavigationController = @"ExpansionNavigationController";

NSString *const titleCommon = @"共通";
NSString *const englishCommon = @"Common";
NSString *const titleCommonViewController = @"CommonViewController";
NSString *const titleCommonNavigationController = @"CommonNavigationController";

NSString *const titleLearn = @"学習編";
NSString *const englishLearn = @"Learn";
NSString *const titleLearnListViewController = @"LearnListViewController";
NSString *const titleLearnListNavigationController = @"LearnListNavigationController";

NSString *const titleReference = @"リファレンス";
NSString *const englishReference = @"Reference";
NSString *const titleReferenceListViewController = @"ReferenceListViewController";
NSString *const titleReferenceListNavigationController = @"ReferenceListNavigationController";

NSString *const titleLink = @"リンク集";
NSString *const englishLink = @"Link";
NSString *const titleLinkListViewController = @"LinkListViewController";
NSString *const titleLinkListNavigationController = @"LinkListNavigationController";

NSString *const titleSetting = @"設定";
NSString *const englishSetting = @"Setting";
NSString *const titleSettingListViewController = @"SettingListViewController";
NSString *const titleSettingListNavigationController = @"SettingListNavigationController";

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

#pragma mark - @IBAction

- (IBAction)tapSelectViewController:(UIButton *)sender {
    
    if (sender.titleLabel.text) {
        NSLog(@"%@",sender.titleLabel.text);
        
        [self transitionSelectViewControllerName:sender.titleLabel.text];
        //[self conversionViewControllerName:sender.titleLabel.text];
        
    } else {
        NSLog(@"------- not action \n\n%@\n\n------",sender);
    }
}

- (IBAction)tapTopButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapMenuButton:(id)sender {

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

#define AssertFileExists(path) NSAssert([[NSFileManager defaultManager] fileExistsAtPath:path], @"Cannot find the file: %@", path)
#define AssertNibExists(file_name_string) AssertFileExists([[NSBundle mainBundle] pathForResource:file_name_string ofType:@"nib"])

#pragma mark - ViewControllers

- (void)transitionSelectViewControllerName:(NSString *)viewControllerName  {
    NSString *viewControllerFile = [[NSBundle mainBundle] pathForResource:viewControllerName ofType:@"nib"];
    if(!viewControllerFile )
    {
        NSLog(@"------- not viewControllerName \n\n%@\n\n------",viewControllerName);
        return;
    }
    /****
     TODO: nib
    // nibNameにはxibファイル名が入る。
    UINib *selectNibFile = [UINib nibWithNibName:viewControllerName bundle:[NSBundle mainBundle]];
    id selectViewController = [selectNibFile instantiateWithOwner:self options:nil];
    // これでファイルが呼び出せる
     */
    
    __kindof UIViewController *selectViewController = [self conversionViewControllerName:viewControllerName];
    if ([selectViewController isKindOfClass:[UITableViewController class]]) {
        
        UITableViewController *tableViewController = selectViewController;
        selectViewController = tableViewController;
        
    }
    else if ([selectViewController isKindOfClass:[UICollectionViewController class]]) {
        
        UICollectionViewController *collectionViewController = selectViewController;
        
        selectViewController = collectionViewController;
    }
    else if ([selectViewController isKindOfClass:[UINavigationController class]]) {
        
        UINavigationController *navigationController = selectViewController;
        selectViewController = navigationController;
        if (self.navigationController) {
            NSLog(@"ナビゲーションコントローラーの場合は呼び出さない");
            [self dismissViewControllerAnimated:YES completion:nil];
            return;
        }
    }
    else if ([selectViewController isKindOfClass:[UITabBarController class]]) {
        
        UITabBarController *tabBarController = selectViewController;
        selectViewController = tabBarController;
    }
    else if ([selectViewController isKindOfClass:[UIViewController class]]) {
        
        UIViewController *viewController = selectViewController;
        selectViewController = viewController;
    }
    
    if(self.navigationController) {
        [self.navigationController pushViewController:selectViewController animated:YES];
    } else {
        [self presentViewController:selectViewController animated:YES completion:^{
            
        }];
    }

}

- (nullable __kindof UIViewController *)conversionViewControllerName:(NSString *)viewControllerName {
    Class class = NSClassFromString(viewControllerName);
    if (class) {
       return [[class alloc] init];
    }
    return nil;
}

+ (NSArray *)mainMenuList {
    return @[
             // チュートリアル
             @{
                 @"title":
                     titleTutorial,
                 @"storyboardName":
                     @"Main",
                 @"viewControllerName":
                     titleTutorialListNavigationController,
                 },
             // 共通
             @{
                 @"title":
                     titleCommon,
                 @"storyboardName":
                     @"Main",
                 @"viewControllerName":
                     titleCommonNavigationController,
                 },
             // 基礎編
             @{
                 @"title":
                     titleBasic,
                 @"storyboardName":
                     @"Main",
                 @"viewControllerName":
                     titleBasicNavigationController,
                 },
             // 応用編
             @{
                 @"title":
                     titleExpansion,
                 @"storyboardName":
                     @"Main",
                 @"viewControllerName":
                     titleExpansionNavigationController,
                 },
             // 学習編
             @{
                 @"title":
                     titleLearn,
                 @"storyboardName":
                     @"Main",
                 @"viewControllerName":
                     titleLearnListNavigationController,
                 },
             
             /* TODO:リファレンス
              @{
              @"title":
              titleReference,
              @"storyboardName":
              @"Main",
              @"viewControllerName":
              titleReferenceListNavigationController,
              },
              */
             
             // リンク集
             @{
                 @"title":
                     titleLink,
                 @"storyboardName":
                     @"Main",
                 @"viewControllerName":
                     titleLinkListNavigationController,
                 },
             
             // 設定
             @{
                 @"title":
                     titleSetting,
                 @"storyboardName":
                     @"Main",
                 @"viewControllerName":
                     titleSettingListNavigationController,
                 },
             
             ];
}

@end
