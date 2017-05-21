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
    
    if ([self.sortParameter isEqualToString:@"search"]) {
        return [self.subjectDictionary count];
    } else {
        return [self.locationDictionary count];
    }
    
}
//should have a checker helper function to check subject and location
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    

    if ([self.sortParameter isEqualToString:@"search"]) {
        NSString *key = self.subjects[section];
        return [self.subjectDictionary[key] count];
    } else {
        NSString *key = self.locations[section];
        return [self.locationDictionary[key] count];
    }
}
//should have a checker helper function to check subject and location
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


//headerview should update it's label based on passed in value.
//should have a checker helper function to check subject and location
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {

    HeaderView *cell = [collectionView dequeueReusableSupplementaryViewOfKind:(NSString *)kind withReuseIdentifier:@"cell" forIndexPath:indexPath];
      NSInteger section = indexPath.section;
        cell.headerLabel.text = @"";
    if ([self.sortParameter isEqualToString:@"subject"]) {
        
        NSString *key = self.subjects[section];
        PhotoObject *po = self.subjectDictionary[key][indexPath.row];
        cell.headerLabel.text = po.subject;
        
        
    } else if ([self.sortParameter isEqualToString:@"location"]){
        NSString *key = self.locations[section];
        PhotoObject *po = self.locationDictionary[key][indexPath.row];
        cell.headerLabel.text = po.location;
        
    }
    return cell;
}



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

//could switch to 1 dictionary and that dictionary gets updated based on the sort parameter at the top.
//then both of the below methods

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
    while (i < 10) {
        PhotoObject *po = [[PhotoObject alloc]initWithName:[NSString stringWithFormat:@"image%lu",i] andSubject:[NSString stringWithFormat:@"Trip Photos"] andLocation:[NSString stringWithFormat:@"Sri Lanka"]];
        [photos addObject:po];
        PhotoObject *po1 = [[PhotoObject alloc]initWithName:[NSString stringWithFormat:@"image%lu",i] andSubject:@"Mountain Climbing" andLocation:@"Adams Peak"];
        [photos addObject:po1];

        
        i++;
    }

    
    
    return photos;
    
    
}


@end
