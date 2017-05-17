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



@end
