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
#import "PhotoManager.h"
#import "PhotoSearchOrganizer.h"
#import "HeaderView.h"

@interface PhotoManager()



@end

@implementation PhotoManager

-(instancetype)init {
    
    if (self = [super init]){
        
        _photoArray = [self createOrganizer];
 
        
//        [self createPhotos];
//        _photoBook = [[NSMutableDictionary alloc]init];
        
//        for (PhotoObject *photoObject in _photoArray) {
//            
//        }
//        
        
        
    }
    
    return self;
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
   return  [self.photoArray count];
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return [self.photoArray[section].photoArray count];
    
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    PhotoOrganizer *organizer = self.photoArray[indexPath.section];
    PhotoObject *photoObject = organizer.photoArray[indexPath.row];
    cell.photoObject = photoObject;
    
    return cell;
    
}

-(NSMutableArray <PhotoObject *>*)createPhotos {
    NSMutableArray *photos = [[NSMutableArray alloc]init];
    NSInteger i = 1;
    while (i < 11) {
        PhotoObject *photoObject = [[PhotoObject alloc] initWithName:[NSString stringWithFormat:@"image%lu",i]];
                                    [photos addObject:photoObject];
        i++;
    }
    return photos;
    
    
}

- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    HeaderView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:@"cell" forIndexPath:indexPath];
      NSInteger section = indexPath.section;
    PhotoOrganizer *po = self.photoArray[section];
    cell.organizer = po;
    
    
    
    return cell;
}

-(NSMutableArray <PhotoOrganizer *> *) createOrganizer {
    NSMutableArray *organizers = [[NSMutableArray alloc]init];
    
    PhotoSearchOrganizer *object1 = [[PhotoSearchOrganizer alloc]initWithName:@"Subject1"];
    PhotoSearchOrganizer *object2 = [[PhotoSearchOrganizer alloc]initWithName:@"Subject2"];
    PhotoSearchOrganizer *object3 = [[PhotoSearchOrganizer alloc]initWithName:@"Subject3"];
    [organizers addObject:object1];
    [organizers addObject:object2];
    [organizers addObject:object3];
    
    return organizers;
}




@end
