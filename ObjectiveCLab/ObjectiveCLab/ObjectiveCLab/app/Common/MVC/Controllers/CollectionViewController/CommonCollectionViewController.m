//
//  CommonCollectionViewController.m
//  ObjectiveCLab/Common/MVC/Controllers
//
//  Created by Ohshima You on 2019/06/19.
//  Copyright © 2019 Team SunStripe. All rights reserved.
//

#import "CommonCollectionViewController.h"

@interface CommonCollectionViewController ()

@property (assign) NSInteger viewDidCount;

@end

@implementation CommonCollectionViewController

static NSString * const reuseIdentifier = @"CommonCollectionViewCell";

- (instancetype)init{
    self = [super init];
    if (self) {
        
        UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize = CGSizeMake(100, 100);
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
        self.collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 60, 320, 500) collectionViewLayout:flowLayout];
    
        self.collectionView.delegate = self;
        self.collectionView.dataSource = self;
        _viewDidCount = 0;
        // self.view = self.collectionView;
        [self.view addSubview:self.collectionView];
    }
    return self;
}

- (void)viewDidLoad {
    _viewDidCount++;
    // viewDidLoad 走らない・・・・
    [super viewDidLoad];
    self.title = NSStringFromClass([self class]);
    self.navigationItem.prompt = @"Team Sun Stripe";
    
    if (self.navigationController) {
        
    } else {
        
    }
    [self settingNavigationBar];
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Register cell classes
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    
    
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated {
    if (_viewDidCount == 0) {
        // viewDidLoadが呼ばれない謎な対応
        [self viewDidLoad];
    }
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [self promp];
}

- (void)settingNavigationBar {
    if(!self.navigationController.childViewControllers){
        
    } else {
        
    }
    self.commonNavigationBar = [CommonNavigationBar settingCommonNavigationBar:self.commonNavigationBar withView:self.view];
    
    self.commonNavigationBar.navigationTitle.title = self.title;
    self.commonNavigationBar.commonNavigationBarDelegate = self;
    self.navigationItem.leftBarButtonItem = self.commonNavigationBar.commonLeftBarButtonItem;
    self.navigationItem.rightBarButtonItem = self.commonNavigationBar.commonRightBarButtonItem;
    self.navigationItem.backBarButtonItem = self.commonNavigationBar.commonBackBarButtonItem;
    
    if(self.navigationController.childViewControllers){
        self.commonNavigationBar.commonNavigationBarDelegate = self;
        self.commonNavigationBar.hidden = YES;
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.rightBarButtonItems = @[self.commonNavigationBar.commonRightBarButtonItem,self.commonNavigationBar.commonLeftBarButtonItem];
    }
}

- (void)promp {
    [self performSelector:@selector(animationPrompt:) withObject:@YES afterDelay:0.3];
}

- (void)animationPrompt:(BOOL)animated {
    self.navigationItem.prompt = titleCommon;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
#warning Incomplete implementation, return the number of sections
    return 5;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
#warning Incomplete implementation, return the number of items
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    // Configure the cell
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

/*
// Uncomment this method to specify if the specified item should be highlighted during tracking
- (BOOL)collectionView:(UICollectionView *)collectionView shouldHighlightItemAtIndexPath:(NSIndexPath *)indexPath {
	return YES;
}
*/

/*
// Uncomment this method to specify if the specified item should be selected
- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}
*/

/*
// Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
- (BOOL)collectionView:(UICollectionView *)collectionView shouldShowMenuForItemAtIndexPath:(NSIndexPath *)indexPath {
	return NO;
}

- (BOOL)collectionView:(UICollectionView *)collectionView canPerformAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	return NO;
}

- (void)collectionView:(UICollectionView *)collectionView performAction:(SEL)action forItemAtIndexPath:(NSIndexPath *)indexPath withSender:(id)sender {
	
}
*/


#pragma mark - CommonNavigationBarDelegate

- (void)navigation:(CommonNavigationBar *)navigationBar backButton:(UIBarButtonItem *)backButton {
    
}

- (void)navigation:(CommonNavigationBar *)navigationBar menuButton:(UIBarButtonItem *)menuButton {
    
}

- (void)navigation:(CommonNavigationBar *)navigationBar topButton:(UIBarButtonItem *)topButton {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}


@end
