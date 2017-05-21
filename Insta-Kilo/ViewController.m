//
//  ViewController.m
//  Insta-Kilo
//
//  Created by Marc Maguire on 2017-05-17.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ViewController.h"
#import "PhotoManager.h"

@interface ViewController () <UICollectionViewDelegate>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UISegmentedControl *segmentedControl;

@property (nonatomic) PhotoManager *photoManager;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.photoManager = [[PhotoManager alloc]init];
    CGFloat width = self.view.frame.size.width / 3;
    ((UICollectionViewFlowLayout *)self.collectionView.collectionViewLayout).itemSize = CGSizeMake(width, width);
    [self searchCriteriaChanged:self.segmentedControl];

    
    self.collectionView.dataSource = self.photoManager;

//    [self.photoManager setupData];

//    [self.collectionView reloadData];
}

-(IBAction)searchCriteriaChanged:(UISegmentedControl *)sender{
    
//    NSString *value = [notification.userInfo[@"segmentValue"] stringValue];


    if (sender.selectedSegmentIndex == 0){
        self.photoManager.sortParameter = @"subject";
    } else {
        self.photoManager.sortParameter = @"location";
    }
    [self.collectionView reloadData];
    
//    self.photoManager.sortParameter
    
    
}
- (IBAction)segmentedControlChanged:(UISegmentedControl *)sender {
    
    //create a reference to the notification center
    NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
    
    //create custom notification and what data to send.
    NSNotification *segmentedControlNotification = [[NSNotification alloc]initWithName:@"segmentChangedNotification" object:self userInfo:@{ @"segmentValue" : @(sender.selectedSegmentIndex) }];
    [notificationCenter postNotification:segmentedControlNotification];
}
@end
