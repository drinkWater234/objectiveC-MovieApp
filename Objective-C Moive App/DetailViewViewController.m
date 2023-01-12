//
//  DetailViewViewController.m
//  Objective-C Moive App
//
//  Created by Consultant on 1/11/23.
//

#import "DetailViewViewController.h"

@interface DetailViewViewController ()



@end

@implementation DetailViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.movieTitle.text = self.theTitle;
    self.movieImage.image = self.theImage;
    self.movieOverview.text = self.theOverview;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
