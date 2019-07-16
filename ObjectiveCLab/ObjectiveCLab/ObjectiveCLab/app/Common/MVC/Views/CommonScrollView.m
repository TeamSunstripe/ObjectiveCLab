//
//  CommonScrollView.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonScrollView.h"

@implementation CommonScrollView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (nullable CommonScrollView *)commonScrollViewNibOwner:(id)owner {
    CommonScrollView *commonScrollView = nil;
    NSString *selectNibName = NSStringFromClass([CommonScrollView class]);
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
        commonScrollView = (CommonScrollView *)nibViews.firstObject;
    }
    return commonScrollView;
}

+ (CommonScrollView *)settingCommonScrollView:(CommonScrollView *)commonScrollView withView:(UIView *) selfView {
    if (!commonScrollView){
        commonScrollView = [CommonScrollView commonScrollViewNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonScrollView]) {
        commonScrollView.frame = selfView.frame;
        [selfView addSubview:commonScrollView];
    }
    return commonScrollView;
}

@end

@implementation UIScrollView (Common)

@end
