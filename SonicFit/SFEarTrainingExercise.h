//
//  SFEarTrainingExercise.h
//  SonicFit
//
//  Created by Nihar Mehta on 1/26/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SFEarTrainingExercise : NSObject
- (instancetype)initWithItemName:(NSString *)soundFile
                       noteCount:(int)noteCount
                          answer:(NSString *)answer;

- (instancetype)initWithNotes:(NSArray *)notes
              notesDictionary:(NSDictionary *)notesDictionary;

- (void)playNotes;

@property (nonatomic, copy) NSString *soundFileName;
@property (nonatomic, copy) NSArray *notes;
@property (nonatomic) NSDictionary *notesDictionary;
@property (nonatomic, copy) NSString *answer;
@property (nonatomic) int noteCount;

@end
