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
        
        //        _photoArray = [self createOrganizer];
        _photos = [self createPhotos];
        _subjects = [[NSMutableArray alloc]init];
        _locations = [[NSMutableArray alloc]init];
        
        
        _subjectDictionary = [NSMutableDictionary new];
        _locationDictionary = [NSMutableDictionary new];
        _sortParameter = @"search";
        
        //        [self createPhotos];
        //        _photoBook = [[NSMutableDictionary alloc]init];
        
        //        for (PhotoObject *photoObject in _photoArray) {
        //
        //        }
        //
        [self setupData];
        
    }
    
    return self;
}


-(void)setupData{
    
    [self updateSubjects];
    [self updateLocations];
    [self updateSubjectDictionary];
    [self updatelocationDictionary];
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
    
    if ([self.sortParameter isEqualToString:@"search"]) {
        return [self.subjectDictionary count];
    } else {
        return [self.locationDictionary count];
    }
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    //    return [self.photoArray[section].photoArray count];
    if ([self.sortParameter isEqualToString:@"search"]) {
        NSString *key = self.subjects[section];
        return [self.subjectDictionary[key] count];
    } else {
        NSString *key = self.locations[section];
        return [self.locationDictionary[key] count];
    }
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    PhotoCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    if ([self.sortParameter isEqualToString:@"search"]) {
        NSString *key = self.subjects[indexPath.section];
        PhotoObject *po = self.subjectDictionary[key][indexPath.row];
        cell.photoObject = po;
        return cell;
        
    } else {
        NSString *key = self.locations[indexPath.section];
        PhotoObject *po = self.locationDictionary[key][indexPath.row];
        cell.photoObject = po;
        return cell;
    }
    
    
}



//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
//
//    HeaderView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:@"cell" forIndexPath:indexPath];
//      NSInteger section = indexPath.section;
//    PhotoOrganizer *po = self.photoArray[section];
//    cell.organizer = po;
//
//    if ([self.sortParameter isEqualToString:@"search"]) {
//        NSString *key = self.subjects[indexPath.section];
//        PhotoObject *po = self.subjectDictionary[key][indexPath.row];
//        cell.photoObject = po;
//        return cell;
//        
//    } else {
//        NSString *key = self.locations[indexPath.section];
//        PhotoObject *po = self.locationDictionary[key][indexPath.row];
//        cell.photoObject = po;
//        return cell;
//    }
//
//}

//-(NSMutableArray <PhotoOrganizer *> *) createOrganizer {
//    NSMutableArray *organizers = [[NSMutableArray alloc]init];
//
//    PhotoSearchOrganizer *object1 = [[PhotoSearchOrganizer alloc]initWithName:@"Subject1"];
//    PhotoSearchOrganizer *object2 = [[PhotoSearchOrganizer alloc]initWithName:@"Subject2"];
//    PhotoSearchOrganizer *object3 = [[PhotoSearchOrganizer alloc]initWithName:@"Subject3"];
//    [organizers addObject:object1];
//    [organizers addObject:object2];
//    [organizers addObject:object3];
//
//    return organizers;
//}

-(void)updateSubjects{
    
    for (PhotoObject *po in self.photos) {
        if ([self.subjects containsObject:po.subject]) {
            continue;
        } else {
            [self.subjects addObject:po.subject];
        }
    }
    
    
}
-(void)updateLocations{
    
    for (PhotoObject *po in self.photos) {
        if ([self.locations containsObject:po.location]) {
            continue;
        } else {
            [self.locations addObject:po.location];
        }
    }
}

-(void)updateSubjectDictionary{
    
    for (PhotoObject *photo in self.photos) {
        if (!self.subjectDictionary[photo.subject]){
            self.subjectDictionary[photo.subject] = [NSMutableArray array];
        }
        [self.subjectDictionary[photo.subject] addObject:photo];
        
    }
    
    
}
-(void)updatelocationDictionary{
    
    for (PhotoObject *photo in self.photos) {
            if (!self.locationDictionary[photo.location]){
                self.locationDictionary[photo.location] = [NSMutableArray array];
            }
                 [self.locationDictionary[photo.location] addObject:photo];
            
        }
    
    
    
}


-(NSMutableArray <PhotoObject *>*)createPhotos {
    NSMutableArray *photos = [[NSMutableArray alloc]init];
    NSInteger i = 1;
    while (i < 11) {
        PhotoObject *po = [[PhotoObject alloc]initWithName:[NSString stringWithFormat:@"image%lu",i] andSubject:[NSString stringWithFormat:@"image%lu",i] andLocation:[NSString stringWithFormat:@"image%lu",i]];
        [photos addObject:po];
        i++;
    }
    return photos;
    
    
}


@end
