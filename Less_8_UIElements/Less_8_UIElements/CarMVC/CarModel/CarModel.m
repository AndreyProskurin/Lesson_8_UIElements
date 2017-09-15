//
//  CarModel.m
//  Less_8_UIElements
//
//  Created by Andrey Proskurin on 07.09.17.
//  Copyright © 2017 Andrey Proskurin. All rights reserved.
//

#import "CarModel.h"

@interface CarModel ()

@end

@implementation CarModel

+ (NSArray *)listOfCars {
    
    return @[@"Audi", @"Porsche", @"Honda", @"Lexus",
             @"Mazda", @"Skoda", @"Opel", @"Lamborghini",
             @"Nissan", @"Subaru", @"Dodge", @"Ford",
             @"Tesla", @"Ferrari", @"Maserati", @"BMW"];
}

- (NSMutableArray *)carModelsArray {
    
    if (!_carModelsArray) {
        _carModelsArray = [CarModel listOfCars];
    }
    
    return _carModelsArray;
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
    
    self.carModelsArray = [NSMutableArray arrayWithArray:tempArray];
}

@end
