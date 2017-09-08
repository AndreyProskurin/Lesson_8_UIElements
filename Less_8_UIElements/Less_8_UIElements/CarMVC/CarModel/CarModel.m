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
        _carModelsArray = [[NSMutableArray alloc] initWithObjects:@"Audi", @"Porsche", @"Honda", @"Lexus",
                                                                  @"Mazda", @"Skoda", @"Opel", @"Lamborghini",
                                                                  @"Nissan", @"Subaru", @"Dodge", @"Ford",
                                                                  @"Tesla", @"Ferrari", @"Maserati", @"BMW", nil];
    }
    
    return _carModelsArray;
}

- (void)refreshDataList:(NSMutableArray *)array {
    
    NSMutableArray *mutArray = [NSMutableArray new];
    
    for (NSUInteger i = 0; i < array.count; i++) {
        
        NSString *string = [NSString stringWithFormat:@"Car Model: %@", [array objectAtIndex:arc4random() % array.count]];
        
        [mutArray addObject:string];
        self.carModelsArray = [NSMutableArray array];
        self.carModelsArray = [NSMutableArray arrayWithArray:mutArray];
        
    }
}

@end
