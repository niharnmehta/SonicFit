//
//  SFExerciseNotes.h
//  SonicFit
//
//  Created by Nihar Mehta on 3/23/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SFExerciseNotes : NSObject

- (NSArray *)getNextExerciseNotesForLevel:(int)level;

@property (nonatomic) NSArray *exerciseNotesArray1;
@property (nonatomic) NSArray *exerciseNotesArray2;
@property (nonatomic) NSArray *exerciseNotesArray3;

@end
