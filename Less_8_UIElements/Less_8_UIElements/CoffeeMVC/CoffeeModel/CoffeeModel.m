//
//  CoffeeModel.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 07.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CoffeeModel.h"

@interface CoffeeModel ()

@end

@implementation CoffeeModel

+ (NSArray *)listOfCoffees {
    
    return @[@"Latte", @"Cappuccino", @"Mocha", @"Machiato",
             @"Dopio", @"Flat white", @"Americano", @"Cortado",
             @"Espresso"];
}

- (NSMutableArray *)coffeeModelsArray {
    
    if (!_coffeeModelsArray) {
        _coffeeModelsArray = [CoffeeModel listOfCoffees];
    }
    
    return _coffeeModelsArray;
}

- (void)refreshDataList:(NSMutableArray *)dataList {
    
    NSMutableArray *tempArray = [NSMutableArray new];
    NSMutableArray *indexes = [NSMutableArray array];
    
    for (NSInteger index = 0; index < dataList.count; index++)
    {
        [indexes addObject:@(index)];
    }
    
    while (indexes.count)
    {
        NSInteger randomValue = arc4random() % indexes.count;
        NSInteger randomIndex = [[indexes objectAtIndex:randomValue] integerValue];
        
        NSString *string = dataList[randomIndex];
        
        [tempArray addObject:string];
        [indexes removeObjectAtIndex:randomValue];
    }
    
    self.coffeeModelsArray = [NSMutableArray arrayWithArray:tempArray];
}


@end
