//
//  PhotoObject.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PhotoObject.h"

@interface PhotoObject()

@property (nonatomic,readwrite) NSString *name;
@property (nonatomic,readwrite) NSString *subject;

@end

@implementation PhotoObject

-(instancetype)initWithName:(NSString *)name andSubject:(NSString *)subject andLocation:(NSString *)location;
{
    
    if (self = [super init]) {
        _name = name;
        _subject = subject;
        _location = location;
        _image = [UIImage imageNamed:name];
    }
    
    return self;
}

@end
