//
//  TableViewController.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 08.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "TableViewController.h"
#import "ViewController.h"

static NSString *const cellIdentifier = @"cell";

@interface TableViewController ()

@property (strong, nonatomic) NSMutableArray *arrayOfData;

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.arrayOfData = [NSMutableArray array];
    
    for (NSUInteger i = 0; i < 20; i++) {
        [self.arrayOfData addObject:[NSString stringWithFormat:@"String %lu", i+1]];
    }
    
    // Uncomment the following line to preserve selection between presentations.
     self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
     self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.arrayOfData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    cell.textLabel.text = [self.arrayOfData objectAtIndex:indexPath.row];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    
    if (indexPath.row == 2) {
        return NO;
    }
    
    return YES;
}



// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [self.arrayOfData removeObjectAtIndex:indexPath.row];
        
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}



// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
    
    // изменяем данные, чтоб изменения отображались корректно в интерфейсе (меняем местами элементы массива по индексу).
    
    NSString *movableValue = [self.arrayOfData objectAtIndex:fromIndexPath.row];
    NSString *staticValue = [self.arrayOfData objectAtIndex:toIndexPath.row];
    
    [self.arrayOfData replaceObjectAtIndex:toIndexPath.row withObject:movableValue];
    [self.arrayOfData replaceObjectAtIndex:fromIndexPath.row withObject:staticValue];
}



// Override to support conditional rearranging of the table view.
// возможность перетаскивания ячеек
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    
    if (indexPath.row == 5) {
        return NO;
    }
    return YES;
}


// Когда нажал на ячейку, вызывается этот метод

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *selectedCellString = self.arrayOfData[indexPath.row];
    NSLog(@"was selected %@", selectedCellString);
}




#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell *)cell {
    
    ViewController *vc = [segue destinationViewController];
    vc.titleVC = cell.textLabel.text;
    
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}


@end
