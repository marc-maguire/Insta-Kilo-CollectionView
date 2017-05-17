//
//  PhotoManager.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PhotoManager.h"
#import "ViewController.h"
#import "PhotoObject.h"
#import "PhotoCell.h"

@interface PhotoManager()



@end

@implementation PhotoManager

-(instancetype)init {
    
    if (self = [super init]){
        _photoArray = [self createPhotos];
        _photoBook = [[NSMutableDictionary alloc]init];
        
//        for (PhotoObject *photoObject in _photoArray) {
//            
//        }
//        
        
        
    }
    
    return self;
}

-(NSMutableArray<PhotoObject *> *)photoArray {
    
    if (_photoArray == nil) {
        _photoArray = [[NSMutableArray alloc] init];
    }
    
    return _photoArray;
}

#pragma mark - Data Source Methods

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
//    NSString *subject = [[NSString alloc]init];
//    NSInteger count = 1;
//    
//    if (self.photoArray != nil) {
//        subject = self.photoArray[0].subject;
//    }
//    
//    for (PhotoObject *photoObject in self.photoArray) {
//        if ([photoObject.subject isEqualToString:subject]){
//            continue;
//        } else {
//            count ++;
//        }
//        
//        
//    }
//    return count;
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.photoArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.photoObject = self.photoArray[indexPath.row];
    
    return cell;
    
}

-(NSMutableArray <PhotoObject *>*)createPhotos {
    NSMutableArray *photos = [[NSMutableArray alloc]init];
    NSInteger i = 1;
    while (i < 11) {
        PhotoObject *photoObject = [[PhotoObject alloc] initWithName:[NSString stringWithFormat:@"image%lu",i] andSubject:@"photo" andLocation:[NSString stringWithFormat:@"location%lu",i]];
        [photos addObject:photoObject];
        i++;
    }
    return photos;
    
    
}




@end
