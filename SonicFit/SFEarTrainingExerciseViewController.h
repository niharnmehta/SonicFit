//
//  ETTestViewController.h
//  EarTraining
//
//  Created by Nihar Mehta on 1/19/14.
//  Copyright (c) 2014 LinkedIn Corp. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SFEarTrainingExercise;

@interface SFEarTrainingExerciseViewController : UIViewController

- (IBAction)playNotes:(id)sender;
@property (nonatomic) int level;
@property (nonatomic, strong) SFEarTrainingExercise *currentExercise;

@end



