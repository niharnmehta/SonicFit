//
//  SFNote.m
//  SonicFit
//
//  Created by Nihar Mehta on 3/22/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import "SFNote.h"

@implementation SFNote
- (instancetype)initWithNoteName:(NSString *)noteName
                       soundFile:soundFile;
{
    // Call the superclass's designated initializer
    self = [super init];
    // Did the superclass's designated initializer succeed?
    if (self) {
        // Give the instance variables initial values
        self.noteName = noteName;
        self.soundFileName = soundFile;
        
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
                                   reason:@"Use initWithNoteName:"
                                 userInfo:nil];
}

- (NSString *)description
{
    NSString *descriptionString =
    [[NSString alloc] initWithFormat:@"Note text:%@ Sound file: %@",
     self.noteName,
     self.soundFileName];
    return descriptionString;
}

- (void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}


@end
