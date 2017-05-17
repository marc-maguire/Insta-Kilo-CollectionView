//
//  PhotoAssistantManager.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PhotoOrganizer.h"

@implementation PhotoOrganizer

- (instancetype)initWithName:(NSString *)name {
    
    if (self = [super init]){
        
        _name = name;
        _photoArray = [self createPhotos];
    }
    
    return self;
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

@end
