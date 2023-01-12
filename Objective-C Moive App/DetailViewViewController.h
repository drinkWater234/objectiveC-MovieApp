//
//  DetailViewViewController.h
//  Objective-C Moive App
//
//  Created by Consultant on 1/11/23.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewViewController : ViewController


@property (strong, nonatomic) NSString *theTitle;
@property (strong, nonatomic) NSString *theOverview;
@property (strong, nonatomic) UIImage *theImage;

    @property (strong, nonatomic) IBOutlet UIImageView* movieImage;
    @property (strong, nonatomic) IBOutlet UILabel* movieTitle;
    @property (strong, nonatomic) IBOutlet UILabel* movieOverview;


@end

NS_ASSUME_NONNULL_END
