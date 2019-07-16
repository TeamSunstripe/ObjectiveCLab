//
//  CommonSegmentedControl.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonSegmentedControl.h"

@implementation CommonSegmentedControl

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (nullable CommonSegmentedControl *)commonSegmentedControlNibOwner:(id)owner {
    CommonSegmentedControl *commonSegmentedControl = nil;
    NSString *selectNibName = NSStringFromClass([CommonSegmentedControl class]);
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
        commonSegmentedControl = (CommonSegmentedControl *)nibViews.firstObject;
    }
    return commonSegmentedControl;
}

+ (CommonSegmentedControl *)settingCommonSegmentedControl:(CommonSegmentedControl *)commonSegmentedControl withView:(UIView *) selfView {
    if (!commonSegmentedControl){
        commonSegmentedControl = [CommonSegmentedControl commonSegmentedControlNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonSegmentedControl]) {
        commonSegmentedControl.frame = selfView.frame;
        [selfView addSubview:commonSegmentedControl];
    }
    return commonSegmentedControl;
}

@end

@implementation UISegmentedControl (Common)

@end
