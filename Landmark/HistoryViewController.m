//
//  HistoryViewController.m
//  Landmark
//
//  Created by Lanvige Jiang on 4/28/12.
//  Copyright (c) 2012 LANVIGE. All rights reserved.
//

#import "HistoryViewController.h"

#import "RestKit/RestKit.h"
#import "RestKit/UI.h"

#import "LMUser.h"

@interface HistoryViewController ()

@property (nonatomic, strong) RKFetchedResultsTableController *tableController;

@end


@implementation HistoryViewController

@synthesize tableController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) 
    {
        // Set the title and image for Tab bar.
        self.title = NSLocalizedString(@"history", @"");
        self.tabBarItem.image = [UIImage imageNamed:@"history"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBar.barStyle = UIBarStyleBlackOpaque;
    self.navigationItem.title = NSLocalizedString(@"history", @"");
    
    
    self.tableController = [[RKObjectManager sharedManager] fetchedResultsTableControllerForTableViewController:self];
    self.tableController.autoRefreshFromNetwork = YES;
    self.tableController.resourcePath = @"api/v1/users";
    self.tableController.variableHeightRows = YES;
    
    RKTableViewCellMapping *cellMapping = [RKTableViewCellMapping cellMapping];
    cellMapping.cellClassName = @"LMUserCell";
    cellMapping.reuseIdentifier = @"LMUser";
    cellMapping.rowHeight = 100;
    
    [cellMapping mapKeyPath:@"name" toAttribute:@"nameLable.text"];
    
    [tableController mapObjectsWithClass:[LMUser class] toTableCellsWithMapping:cellMapping];
    [self.tableView registerNib:[UINib nibWithNibName:@"LMUserCell" bundle:nil] forCellReuseIdentifier:@"LMUser"];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    [tableController loadTable];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
