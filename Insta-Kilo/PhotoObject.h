//
//  PhotoObject.h
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoObject : NSObject

@property (nonatomic,readonly) NSString *name;
@property (nonatomic,readonly) NSString *subject;
@property (nonatomic, readonly) NSString *location;
@property (nonatomic) UIImage *image;

-(instancetype)initWithName:(NSString *)name andSubject:(NSString *)subject andLocation:(NSString *)location;

@end
