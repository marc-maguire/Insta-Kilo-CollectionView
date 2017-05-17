//
//  HeaderView.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "HeaderView.h"
#import "PhotoOrganizer.h"

@interface HeaderView ()

@property (weak, nonatomic) IBOutlet UILabel *headerLabel;


@end

@implementation HeaderView

-(void)setOrganizer:(PhotoOrganizer *)organizer {
    
    self.headerLabel.text = organizer.name;
    _organizer = organizer;
}


@end
