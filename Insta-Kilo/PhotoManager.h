//
//  PhotoManager.h
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoObject.h"
#import "PhotoOrganizer.h"

@interface PhotoManager : NSObject  <UICollectionViewDataSource>

//@property (nonatomic) NSMutableDictionary <NSString *, NSMutableArray<PhotoObject *> *>* photoBook;
@property (nonatomic) NSString *sortParameter;
@property (nonatomic) NSMutableArray <NSString *> *subjects;
@property (nonatomic) NSMutableArray <NSString *> *locations;
@property (nonatomic) NSArray <PhotoObject *> *photos;

@property (nonatomic) NSMutableDictionary <NSString *, NSMutableArray<PhotoObject *> *> *subjectDictionary;
@property (nonatomic) NSMutableDictionary <NSString *, NSMutableArray<PhotoObject *> *> *locationDictionary;






//-(void)setupData;

@end
