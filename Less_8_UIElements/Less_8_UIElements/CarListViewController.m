//
//  CarListViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 06.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CarListViewController.h"

static NSString *const carCellIdentifier = @"carCell";

@interface CarListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *carModels;

@end

@implementation CarListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.carModels = @[@"Camry", @"Prius", @"RAV4", @"Corolla", @"Land Cruiser"];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.carModels.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *carCell = [tableView dequeueReusableCellWithIdentifier:carCellIdentifier];
    
    if (carCell == nil) {
        carCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:carCellIdentifier];
    }
    
    carCell.textLabel.text = [self.carModels objectAtIndex:indexPath.row];
    
    return carCell;
}

@end
