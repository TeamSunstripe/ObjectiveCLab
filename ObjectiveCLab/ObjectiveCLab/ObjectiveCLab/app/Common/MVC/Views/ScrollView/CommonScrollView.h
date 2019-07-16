//
//  CommonScrollView.h
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommonScrollView : UIScrollView

+ (nullable CommonScrollView *)commonScrollViewNibOwner:(id)owner;
+ (CommonScrollView *)settingCommonScrollView:(CommonScrollView *)commonScrollView withView:(UIView *) selfView;

@end

@interface UIScrollView (Common)

@end
