//
//  MainViewController.h
//  ObjectiveCLab/Main
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainViewController : UIViewController

// Tutorial
extern NSString *const titleTutorial;
extern NSString *const englishTutorial;
extern NSString *const titleTutorialListViewController;
extern NSString *const titleTutorialListNavigationController;

// Basic
extern NSString *const titleBasic;
extern NSString *const englishBasic;
extern NSString *const titleBasicViewController;
extern NSString *const titleBasicNavigationController;

// Expansion
extern NSString *const titleExpansion;
extern NSString *const englishExpansion;
extern NSString *const titleExpansionViewController;
extern NSString *const titleExpansionNavigationController;

// Common
extern NSString *const titleCommon;
extern NSString *const englishCommon;
extern NSString *const titleCommonViewController;
extern NSString *const titleCommonNavigationController;

// Learn
extern NSString *const titleLearn;
extern NSString *const englishLearn;
extern NSString *const titleLearnListViewController;
extern NSString *const titleLearnListNavigationController;

// Learn
extern NSString *const titleReference;
extern NSString *const englishReference;
extern NSString *const titleReferenceListViewController;
extern NSString *const titleReferenceListNavigationController;

// Link
extern NSString *const titleLink;
extern NSString *const englishLink;
extern NSString *const titleLinkListViewController;
extern NSString *const titleLinkListNavigationController;

// Setting
extern NSString *const titleSetting;
extern NSString *const englishSetting;
extern NSString *const titleSettingListViewController;
extern NSString *const titleSettingListNavigationController;

#pragma mark - @IBAction

- (IBAction)tapSelectViewController:(UIButton *)sender;

#pragma mark - Param

+ (NSArray *)mainMenuList;

@end

