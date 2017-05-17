//
//  ViewController.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ViewController.h"
#import "PhotoManager.h"

@interface ViewController () <UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (nonatomic) PhotoManager *photoManager;


@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoManager = [[PhotoManager alloc]init];
    self.collectionView.dataSource = self.photoManager;
    
    CGFloat width = self.view.frame.size.width / 3;
    ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout).itemSize = CGSizeMake(width, width);
}


@end
