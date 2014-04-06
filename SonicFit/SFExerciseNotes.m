//
//  SFExerciseNotes.m
//  SonicFit
//
//  Created by Nihar Mehta on 3/23/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFExerciseNotes.h"

@implementation SFExerciseNotes

- (id)init {
    // Call the superclass's designated initializer
    self = [super init];
    // Did the superclass's designated initializer succeed?
    if (self) {
        self.exerciseNotesArray1 = [self getExerciseLevel1];
        self.exerciseNotesArray2 = [self getExerciseLevel2];
    }
    
    // Return the address of the newly initialized object
    return self;
}

- (NSArray *)getExerciseLevel1
{
    NSArray *notes1 = [NSArray arrayWithObjects:@"LA", @"SOL", @"LA", nil];
    NSArray *notes2 = [NSArray arrayWithObjects:@"LA", @"SOL", nil];
    NSArray *notes3 = [NSArray arrayWithObjects:@"MI", @"SOL", @"LA", nil];
    NSArray *notes4 = [NSArray arrayWithObjects:@"MI", @"SOL", @"MI", nil];
    NSArray *notes5 = [NSArray arrayWithObjects:@"SOL", @"LA", @"SOL", nil];
    NSArray *notes6 = [NSArray arrayWithObjects:@"SOL", @"MI", @"SOL", nil];
    NSArray *notes7 = [NSArray arrayWithObjects:@"SOL", @"MI", nil];
    
    NSMutableArray *exercises = [NSMutableArray new];
    [exercises addObject:notes1];
    [exercises addObject:notes2];
    [exercises addObject:notes3];
    [exercises addObject:notes4];
    [exercises addObject:notes5];
    [exercises addObject:notes6];
    [exercises addObject:notes7];
    
    return exercises;
}

- (NSArray *)getExerciseLevel2
{
    NSArray *notes1 = [NSArray arrayWithObjects:@"DO", @"RE", @"DO", nil];
    NSArray *notes2 = [NSArray arrayWithObjects:@"DO", @"RE", @"MI", nil];
    NSArray *notes3 = [NSArray arrayWithObjects:@"MI", @"SOL", @"LA", nil];
    NSArray *notes4 = [NSArray arrayWithObjects:@"MI", @"SOL", @"MI", nil];
    NSArray *notes5 = [NSArray arrayWithObjects:@"SOL", @"LA", @"SOL", nil];
    NSArray *notes6 = [NSArray arrayWithObjects:@"FA", @"SOL", @"TI", nil];
    NSArray *notes7 = [NSArray arrayWithObjects:@"RE", @"FA", @"FA", nil];
    NSArray *notes8 = [NSArray arrayWithObjects:@"LA", @"TI", @"TI", nil];
    NSArray *notes9 = [NSArray arrayWithObjects:@"DO", @"RE", @"MI", @"FA", nil];
    NSArray *notes10 = [NSArray arrayWithObjects:@"DO", @"DO", @"MI", @"MI", nil];
    NSArray *notes11 = [NSArray arrayWithObjects:@"LA", @"RE", @"MI", @"FA", nil];
    
    NSMutableArray *exercises = [NSMutableArray new];
    [exercises addObject:notes1];
    [exercises addObject:notes2];
    [exercises addObject:notes3];
    [exercises addObject:notes4];
    [exercises addObject:notes5];
    [exercises addObject:notes6];
    [exercises addObject:notes7];
    [exercises addObject:notes8];
    [exercises addObject:notes9];
    [exercises addObject:notes10];
    [exercises addObject:notes11];
    
    return exercises;
}

- (NSArray *)getNextExerciseNotesForLevel:(int)level;
{
    if (level == 1)
    {
        int i = rand() % self.exerciseNotesArray1.count;
        return [self.exerciseNotesArray1 objectAtIndex:i];
    }
    else if (level == 2)
    {
        int i = rand() % self.exerciseNotesArray2.count;
        return [self.exerciseNotesArray2 objectAtIndex:i];
    }
    return nil;
}

@end
