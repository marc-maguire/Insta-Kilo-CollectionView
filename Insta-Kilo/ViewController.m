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

@property (weak, nonatomic) IBOutlet UICollectionView *collectionViewController;
@property (nonatomic) PhotoManager *photoManager;


@end

@implementation ViewController 

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoManager = [[PhotoManager alloc]init];
    self.collectionViewController.dataSource = self.photoManager;
}


@end
