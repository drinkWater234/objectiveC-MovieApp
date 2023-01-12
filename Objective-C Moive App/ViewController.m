//
//  ViewController.m
//  Objective-C Moive App
//
//  Created by Consultant on 1/11/23.
//

#import "ViewController.h"
#import "movieTableCell.h"
#import "DetailViewViewController.h"
#import "popModel.h"

/*
@interface popModel : NSObject

@property (nonatomic, strong) NSString *overview;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *poster_path;

@end */

@implementation popModel


@end

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.popularArr = NSMutableArray.new;
    // Do any additional setup after loading the view.
    
    UINib *nib = [UINib nibWithNibName:@"movieTableCell" bundle: nil];
    [self.myTableView registerNib:nib forCellReuseIdentifier: @"cell"];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    [self getJSON];
    
}

- (void) getJSON
{
    NSString *urlString = @"https://api.themoviedb.org/3/movie/popular?api_key=44c6646d5f54689bfe347b17860dcc67&language=en-US&page=1";
    NSURL *url = [NSURL URLWithString: urlString];
    
    [[NSURLSession.sharedSession dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSError *err;
        NSDictionary *popularData = [NSJSONSerialization JSONObjectWithData: data options: NSJSONReadingAllowFragments error: &err];
        if(err)
        {
            NSLog(@"Failed: %@", err);
            return;
        }
        NSMutableArray<popModel*> *myResultsArr = NSMutableArray.new;
        
        NSArray *resultsArr = popularData[@"results"];
        for(NSDictionary *aMovie in resultsArr)
        {
            popModel *myPopModel = popModel.new;
            myPopModel.title = aMovie[@"original_title"];
            myPopModel.overview = aMovie[@"overview"];
            myPopModel.poster_path = aMovie[@"poster_path"];
            NSURL *poster_url = [NSURL URLWithString: [NSString stringWithFormat:@"%@%@", @"https://image.tmdb.org/t/p/original",
                                                      myPopModel.poster_path]];
            NSData *data = [NSData dataWithContentsOfURL:poster_url];
            UIImage *img = [[UIImage alloc] initWithData:data];
            myPopModel.movieImage = img;
            
            [myResultsArr addObject:myPopModel];
            
        }
        
        self.popularArr = myResultsArr;
        
        dispatch_async(dispatch_get_main_queue(), ^{[self.myTableView reloadData];});
        
    }] resume];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.popularArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    movieTableCell *cell = (movieTableCell*)[tableView dequeueReusableCellWithIdentifier: @"cell"];
    popModel* x = self.popularArr[indexPath.row];
    cell.movieImage.image = x.movieImage;
    cell.movieTitle.text = x.title;
    
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    DetailViewViewController *viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"detailView"];
    
    popModel* x = self.popularArr[indexPath.row];
    
    viewController.theTitle = x.title;
    viewController.theOverview = x.overview;
    viewController.theImage = x.movieImage;
     
    [self presentViewController:viewController animated:true completion:Nil];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 120.0;
}


@end
