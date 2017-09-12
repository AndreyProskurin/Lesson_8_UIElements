//
//  CoffeeTableVC.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 09.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CoffeeTableVC.h"
#import "CoffeeModel.h"
#import "ViewController.h"

static NSString *const coffeeNameCellIdentifier = @"coffeeNameCell";

@interface CoffeeTableVC ()

@property (strong, nonatomic) CoffeeModel *coffeeModel;

@end

@implementation CoffeeTableVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.clearsSelectionOnViewWillAppear = YES;
    self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    self.coffeeModel = [[CoffeeModel alloc] init];

}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.coffeeModel.coffeeList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:coffeeNameCellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:coffeeNameCellIdentifier];
    }
    
    CoffeeModel *coffeeModel = self.coffeeModel.coffeeList[indexPath.row];
    cell.textLabel.text = coffeeModel.coffeeName;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.coffeeModel.coffeeList removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    NSString *movableItem = [self.coffeeModel.coffeeList objectAtIndex:fromIndexPath.row];
    NSString *staticItem = [self.coffeeModel.coffeeList objectAtIndex:toIndexPath.row];
    
    [self.coffeeModel.coffeeList replaceObjectAtIndex:toIndexPath.row withObject:movableItem];
    [self.coffeeModel.coffeeList replaceObjectAtIndex:fromIndexPath.row withObject:staticItem];
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    
    NSIndexPath *selectedCellIndexPath = [self.tableView indexPathForCell:cell];
    CoffeeModel *coffeeModel = [self.coffeeModel.coffeeList objectAtIndex:selectedCellIndexPath.row];
    
    ViewController *coffeeViewController = [segue destinationViewController];
    coffeeViewController.coffeeModel = coffeeModel;
    
}

@end
