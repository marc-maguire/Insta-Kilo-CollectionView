//
//  PhotoManager.h
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoObject.h"

@interface PhotoManager : NSObject  <UICollectionViewDataSource>

@property (nonatomic) NSMutableArray <PhotoObject *> *photoArray;

@end
