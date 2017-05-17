//
//  PhotoCell.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "PhotoCell.h"
#import "PhotoObject.h"

@interface PhotoCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;


@end

@implementation PhotoCell

-(void)setPhotoObject:(PhotoObject *)photoObject {
    
    self.imageView.image = photoObject.image;
    
    _photoObject = photoObject;
}

@end
