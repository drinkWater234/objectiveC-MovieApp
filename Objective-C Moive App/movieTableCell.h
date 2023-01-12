//
//  movieTableCell.h
//  Objective-C Moive App
//
//  Created by Consultant on 1/11/23.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface movieTableCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UIImageView* movieImage;
@property (strong, nonatomic) IBOutlet UILabel* movieTitle;

@end

NS_ASSUME_NONNULL_END
