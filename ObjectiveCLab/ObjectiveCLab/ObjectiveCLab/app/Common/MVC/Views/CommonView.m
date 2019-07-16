//
//  CommonView.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonView.h"

@implementation CommonView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (nullable CommonView *)commonViewNibOwner:(id)owner {
    CommonView *commonView = nil;
    NSString *selectNibName = NSStringFromClass([commonView class]);
    NSString *selectNibFile = [[NSBundle mainBundle] pathForResource:selectNibName ofType:@"nib"];
    if(!selectNibFile )
    {
        NSLog(@"------- not selectNibName \n\n%@\n\n------",selectNibName);
        return nil;
    }
    
    // NSBundleから読み込むほうが簡単
    NSLog(@"%@", [[NSBundle mainBundle] loadNibNamed:selectNibName owner:self options:nil]);
    
    UINib *nibFile =[UINib nibWithNibName:selectNibName bundle:[NSBundle mainBundle]];
    NSArray *nibViews = [nibFile instantiateWithOwner:self options:nil];
    if (nibViews) {
        commonView = (CommonView *)nibViews.firstObject;
    }
    return commonView;
}

+ (CommonView *)settingCommonView:(CommonView *)commonView withView:(UIView *) selfView {
    if (!commonView){
        commonView = [CommonView commonViewNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonView]) {
        commonView.frame = selfView.frame;
        [selfView addSubview:commonView];
    }
    return commonView;
}

@end

@implementation UIView (Common)

@end
