//
//  CommonView.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonView : UIView

+ (nullable CommonView *)commonViewNibOwner:(id)owner;
+ (CommonView *)settingCommonView:(CommonView *)commonView withView:(UIView *) selfView;

@end

@interface UIView (Common)

@end
