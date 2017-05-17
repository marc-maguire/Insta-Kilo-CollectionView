//
//  PhotoManager.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PhotoManager.h"
#import "ViewController.h"

@interface PhotoManager() <UICollectionViewDataSource>



@end

@implementation PhotoManager

-(NSMutableArray<PhotoObject *> *)photoArray {
    
    if (_photoArray == nil) {
        _photoArray = [[NSMutableArray alloc] init];
    }
    
    return _photoArray;
}

#pragma mark - Data Source Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 1;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 1;
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    return nil;
}


@end
