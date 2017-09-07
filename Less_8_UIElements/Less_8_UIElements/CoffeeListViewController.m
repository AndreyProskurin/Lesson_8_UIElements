//
//  CoffeeListViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 06.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CoffeeListViewController.h"

static NSString *const coffeeCellIdentifier = @"coffeeCell";

@interface CoffeeListViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSArray *arrayOfCoffeeNames;

@end

@implementation CoffeeListViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.arrayOfCoffeeNames = @[@"Espresso", @"Americano", @"Cappuccino", @"Latte", @"Russiano :D"];
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.arrayOfCoffeeNames.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *coffeeCell = [tableView dequeueReusableCellWithIdentifier:coffeeCellIdentifier];
    
    if (coffeeCell == nil) {
        coffeeCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                            reuseIdentifier:coffeeCellIdentifier];
    }
    
    coffeeCell.textLabel.text = [self.arrayOfCoffeeNames objectAtIndex:indexPath.row];
    
    return coffeeCell;
}

@end
