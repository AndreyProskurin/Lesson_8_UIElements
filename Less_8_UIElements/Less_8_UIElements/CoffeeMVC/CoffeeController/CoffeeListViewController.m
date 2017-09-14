//
//  CoffeeListViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 06.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CoffeeListViewController.h"
#import "CoffeeContentView.h"
#import "CoffeeModel.h"

static NSString *const coffeeCellIdentifier = @"coffeeCell";

@interface CoffeeListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) CoffeeModel *coffeeModel;
@property (weak, nonatomic) IBOutlet CoffeeContentView *coffeeContentView;

@end

@implementation CoffeeListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.coffeeModel = [[CoffeeModel alloc] init];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.coffeeModel.coffeeModelsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *coffeeCell = [tableView dequeueReusableCellWithIdentifier:coffeeCellIdentifier];
    
    if (coffeeCell == nil) {
        coffeeCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:coffeeCellIdentifier];
    }
    
    coffeeCell.textLabel.text = [self.coffeeModel.coffeeModelsArray objectAtIndex:indexPath.row];
    
    return coffeeCell;
}

#pragma mark - Actions

- (IBAction)refreshTheTable:(UIButton *)sender {
    
    [self.coffeeModel refreshDataList:self.coffeeModel.coffeeModelsArray];
    [self.coffeeContentView.coffeeTableView reloadData];
    
    
    
}

@end
