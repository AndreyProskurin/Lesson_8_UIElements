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
    
    for (NSUInteger i = 0; i < dataList.count; i++) {
        
        NSString *string = [NSString stringWithFormat:@"%@", [dataList objectAtIndex:arc4random() % dataList.count]];
        
        [tempArray addObject:string];
        self.carModelsArray = [[NSMutableArray alloc] init];
        self.carModelsArray = [NSMutableArray arrayWithArray:tempArray];
        
    }
}

@end
