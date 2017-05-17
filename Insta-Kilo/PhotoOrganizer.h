//
//  PhotoAssistantManager.h
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PhotoObject.h"

@interface PhotoOrganizer : NSObject

@property (nonatomic) NSString *name;
@property (nonatomic) NSMutableArray <PhotoObject *> *photoArray;

- (instancetype)initWithName:(NSString *)name;

@end
