//
//  CommonImageView.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonImageView.h"

@implementation CommonImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (nullable CommonImageView *)commonImageViewNibOwner:(id)owner {
    CommonImageView *commonImageView = nil;
    NSString *selectNibName = NSStringFromClass([CommonImageView class]);
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
        commonImageView = (CommonImageView *)nibViews.firstObject;
    }
    return commonImageView;
}

+ (CommonImageView *)settingCommonImageView:(CommonImageView *)commonImageView withView:(UIView *) selfView {
    if (!commonImageView){
        commonImageView = [CommonImageView commonImageViewNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonImageView]) {
        commonImageView.frame = selfView.frame;
        [selfView addSubview:commonImageView];
    }
    return commonImageView;
}

@end

@implementation UIImageView (Common)

@end
