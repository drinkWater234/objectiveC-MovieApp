//
//  ViewController.h
//  Objective-C Moive App
//
//  Created by Consultant on 1/11/23.
//

#import <UIKit/UIKit.h>
#import "popModel.h"

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) IBOutlet UITableView *myTableView;
@property (strong, nonatomic) NSMutableArray<popModel*>* popularArr;

@end

