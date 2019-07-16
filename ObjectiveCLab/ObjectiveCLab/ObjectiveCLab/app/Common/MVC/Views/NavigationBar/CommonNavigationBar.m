//
//  CommonNavigationBar.m
//  ObjectiveCLab/Common/MVC/Views
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonNavigationBar.h"

@implementation CommonNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

+ (nullable CommonNavigationBar *)commonNavigationBarNibOwner:(id)owner {
    CommonNavigationBar *commonNavigationBar = nil;
    NSString *selectNibName = NSStringFromClass([CommonNavigationBar class]);
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
        commonNavigationBar = (CommonNavigationBar *)nibViews.firstObject;
    }
    
    if (!commonNavigationBar.commonLeftBarButtonItem.action) {
        [commonNavigationBar.commonLeftBarButtonItem setTarget:commonNavigationBar];
        [commonNavigationBar.commonLeftBarButtonItem setAction:@selector(tapTopButton:)];
    }
    if (!commonNavigationBar.commonRightBarButtonItem.action) {
        [commonNavigationBar.commonRightBarButtonItem setTarget:commonNavigationBar];
        [commonNavigationBar.commonRightBarButtonItem setAction:@selector(tapMenuButton:)];
    }
    if (!commonNavigationBar.commonBackBarButtonItem.action) {
        [commonNavigationBar.commonBackBarButtonItem setTarget:commonNavigationBar];
        [commonNavigationBar.commonBackBarButtonItem setAction:@selector(tapBackButton:)];
    }
    
    return commonNavigationBar;
}

+ (CommonNavigationBar *)settingCommonNavigationBar:(CommonNavigationBar *)commonNavigationBar withView:(UIView *) selfView {
    if (!commonNavigationBar){
        commonNavigationBar = [CommonNavigationBar commonNavigationBarNibOwner:self];
    }
    if (![selfView.subviews containsObject:commonNavigationBar]) {
        commonNavigationBar.frame = selfView.frame;
        [selfView addSubview:commonNavigationBar];
    }
    return commonNavigationBar;
}

- (IBAction)tapTopButton:(id)sender {
    if (self.commonNavigationBarDelegate) {
        [self.commonNavigationBarDelegate navigation:self topButton:sender];
    }
}

- (IBAction)tapMenuButton:(id)sender {
    if (self.commonNavigationBarDelegate) {
        [self.commonNavigationBarDelegate navigation:self menuButton:sender];
    }
}

- (IBAction)tapBackButton:(id)sender {
    if (self.commonNavigationBarDelegate) {
        [self.commonNavigationBarDelegate navigation:self backButton:sender];
    }
}

@end

@implementation UINavigationBar (Common)

@end

