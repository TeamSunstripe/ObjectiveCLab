//
//  CommonSegmentedControl.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonSegmentedControl : UISegmentedControl

+ (nullable CommonSegmentedControl *)commonSegmentedControlNibOwner:(id)owner;
+ (CommonSegmentedControl *)settingCommonSegmentedControl:(CommonSegmentedControl *)commonSegmentedControl withView:(UIView *) selfView;

@end

@interface UISegmentedControl (Common)

@end
