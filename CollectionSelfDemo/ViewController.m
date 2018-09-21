//
//  ViewController.m
//  CollectionSelfDemo
//
//  Created by gcl on 2018/8/24.
//  Copyright © 2018年 gcl. All rights reserved.
//

#import "ViewController.h"
#import "SelfSizingCell.h"
#import "CollectionReusableView.h"

@interface ViewController ()<UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray *data;

@end

@implementation ViewController
static NSString *cid = @"selfsizingcell";
static NSString *headerid = @"selfsizingheader";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSString *str = @"Exceptional materials. The most durable glass ever in a smartphone. A beautiful new gold finish, achieved with an atomic-level process. Precision-machined, surgical-grade stainless steel bands. And a new level of water and dust resistance.";
    self.data = [str componentsSeparatedByString:@" "];
    
    [self.view addSubview:self.collectionView];
    [self.collectionView reloadData];
//    [self.collectionView.collectionViewLayout invalidateLayout];
//    [self.collectionView reloadData];
}

-(UICollectionView *)collectionView{
    
    if (!_collectionView) {
        
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.estimatedItemSize = CGSizeMake(20, 20);

        _collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds  collectionViewLayout:layout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[SelfSizingCell class] forCellWithReuseIdentifier:cid];
        [_collectionView registerClass:[CollectionReusableView class] forSupplementaryViewOfKind:@"kindStr" withReuseIdentifier:headerid];
    }
    return _collectionView;
}

#pragma mark -
#pragma mark - collectionView dataSource delegate
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.data.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    SelfSizingCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cid forIndexPath:indexPath];
    cell.textLabel.text = self.data[indexPath.row];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"kind:%@",kind);

    CollectionReusableView *resuableView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:headerid forIndexPath:indexPath];
    resuableView.titleLabel.text = @"CollectionReusableView";
    return resuableView;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
