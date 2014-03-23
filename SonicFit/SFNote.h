//
//  SFNote.h
//  SonicFit
//
//  Created by Nihar Mehta on 3/22/14.
//  Copyright (c) 2014 FUHSD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface SFNote : NSObject
- (instancetype)initWithNoteName:(NSString *)noteName
                       soundFile:(NSString *)soundFile;

@property (nonatomic, copy) NSString *noteName;
@property (nonatomic, copy) NSString *soundFileName;
@property (nonatomic) SystemSoundID noteSound;

@end
