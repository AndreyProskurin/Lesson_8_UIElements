//
//  CarListViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 06.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CarListViewController.h"
#import "CarModel.h"
#import "CarContentView.h"

static NSString *const carCellIdentifier = @"carCell";

@interface CarListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) CarModel *carModel;
@property (weak, nonatomic) IBOutlet CarContentView *carContentView;

@end

@implementation CarListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    self.carModel = [[CarModel alloc] init];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource methods

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.carModel.carModelsArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *carCell = [tableView dequeueReusableCellWithIdentifier:carCellIdentifier];
    
    if (carCell == nil) {
        carCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:carCellIdentifier];
    }
    
    carCell.textLabel.text = [self.carModel.carModelsArray objectAtIndex:indexPath.row];
    
    return carCell;
}

#pragma mark - Actions

- (IBAction)refreshTheTable:(UIButton *)sender {
    
    [self.carModel refreshDataList:[CarModel listOfCars]];
    [self.carContentView.carTableView reloadData];
    
}



@end
