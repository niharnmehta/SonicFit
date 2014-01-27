//
//  SFEarTrainingExercise.m
//  SonicFit
//
//  Created by Nihar Mehta on 1/26/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFEarTrainingExercise.h"

@implementation SFEarTrainingExercise

- (instancetype)initWithItemName:(NSString *)soundFile
                       noteCount:(int)noteCount
                          answer:(NSString *)answer;
{
    // Call the superclass's designated initializer
    self = [super init];
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        self.soundFileName = soundFile;
        self.noteCount = noteCount;
        self.answer = answer;
        
        NSBundle *bundle = [NSBundle mainBundle];
        NSString *notePath = [bundle pathForResource:self.soundFileName ofType:nil];
        SystemSoundID noteSoundId;
        if (notePath)
        {
            NSURL *noteURL = [NSURL fileURLWithPath:notePath];
            AudioServicesCreateSystemSoundID((__bridge CFURLRef)noteURL, &noteSoundId);
            self.noteSound = noteSoundId;
        }
        else
        {
            NSLog(@"Failed to find path for the sounds file. Bundle is: %@", bundle);
        }
    }
    
    // Return the address of the newly initialized object
    return self;
}

- (id)init {
    @throw [NSException exceptionWithName:@"Must provide sound file name"
                                   reason:@"Use initWithItemName:"
                                 userInfo:nil];
}

- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"Sound file: %@, answer: %@, note count: %d",
     self.soundFileName,
     self.answer,
     self.noteCount];
    return descriptionString;
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
