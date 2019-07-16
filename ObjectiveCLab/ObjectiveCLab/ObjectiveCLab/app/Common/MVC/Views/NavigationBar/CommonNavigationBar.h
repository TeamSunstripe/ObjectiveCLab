//
//  CommonNavigationBar.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CommonNavigationBar;
@protocol CommonNavigationBarDelegate

- (void)navigation:(CommonNavigationBar *)navigationBar backButton:(UIBarButtonItem *)backButton;
- (void)navigation:(CommonNavigationBar *)navigationBar menuButton:(UIBarButtonItem *)menuButton;
- (void)navigation:(CommonNavigationBar *)navigationBar topButton:(UIBarButtonItem *)topButton;

@end

@interface CommonNavigationBar : UINavigationBar

@property (weak, nonatomic) IBOutlet UINavigationItem *navigationTitle;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *commonLeftBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *commonRightBarButtonItem;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *commonBackBarButtonItem;

@property (assign) id<CommonNavigationBarDelegate> commonNavigationBarDelegate;

+ (nullable CommonNavigationBar *)commonNavigationBarNibOwner:(id)owner;
+ (CommonNavigationBar *)settingCommonNavigationBar:(CommonNavigationBar *)commonNavigationBar withView:(UIView *) selfView;
@end

@interface UINavigationBar (Common)

@end
