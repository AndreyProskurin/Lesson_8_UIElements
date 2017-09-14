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
    
    for (NSUInteger i = 0; i < dataList.count; i++) {
        
        NSString *string = [NSString stringWithFormat:@"%@", [dataList objectAtIndex:arc4random() % dataList.count]];
        
        [tempArray addObject:string];
        self.coffeeModelsArray = [[NSMutableArray alloc] init];
        self.coffeeModelsArray = [NSMutableArray arrayWithArray:tempArray];
        
    }
}


@end
