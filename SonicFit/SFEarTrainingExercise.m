//
//  SFEarTrainingExercise.m
//  SonicFit
//
//  Created by Nihar Mehta on 1/26/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFEarTrainingExercise.h"
#import "SFNote.h"

@implementation SFEarTrainingExercise

- (void)playNotes
{
    // Give the instance variables initial values
    int count = self.notes.count;
    for (int i = 0; i < count; i++)
    {
        SFNote *note = [self.notesDictionary objectForKey:[self.notes objectAtIndex:i]];
        AudioServicesPlaySystemSound(note.noteSound);
        usleep(700000);
    }
}

- (instancetype)initWithNotes:(NSArray *)notes
              notesDictionary:(NSDictionary *)notesDictionary;
{
    // Call the superclass's designated initializer
    self = [super init];
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        self.notesDictionary = notesDictionary;
        self.notes = notes;
        
        int count = notes.count;
        NSString *answer;
        for (int i = 0; i < count; i++)
        {
            NSString *note = [notes objectAtIndex:i];
            if (i == 0)
            {
                answer = note;
            }
            else
            {
                answer = [NSString stringWithFormat:@"%@ %@", answer, note];
            }
        }
        self.noteCount = count;
        self.answer = answer;
    }
    
    // Return the address of the newly initialized object
    return self;
}

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
            // self.noteSound = noteSoundId;
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
