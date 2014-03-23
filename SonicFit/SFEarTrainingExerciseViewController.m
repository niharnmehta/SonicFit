//
//  ETTestViewController.m
//  EarTraining
//
//  Created by Nihar Mehta on 1/19/14.
//  Copyright (c) 2014 LinkedIn Corp. All rights reserved.
//

#import "SFEarTrainingExerciseViewController.h"
#import "SFEarTrainingExercise.h"
#import "SFMyRoundRectButton.h"
#import "SFNote.h"

#define kStdButtonWidth		50.0
#define kStdButtonHeight	35.0
#define kViewTag			1		// for tagging our embedded controls for removal at cell recycle time

@interface SFEarTrainingExerciseViewController()
@property (weak, nonatomic) IBOutlet UILabel *userEnteredPrompt;
@property (weak, nonatomic) IBOutlet UILabel *userEnteredNotes;
@property (weak, nonatomic) IBOutlet UILabel *successFailMessage;
@property (weak, nonatomic) IBOutlet UILabel *correctNotes;

@property (nonatomic, readwrite) int currentNoteCount;
@property (nonatomic) NSDictionary *notesDictionary;
@end


@implementation SFEarTrainingExerciseViewController

#pragma mark - Action methods

- (IBAction)notePressed:(UIButton *)sender
{
    AudioServicesPlaySystemSound(1100);
    
    if (self.currentNoteCount == self.currentExercise.noteCount)
    {
        // ignore users input
        return;
    }
    
    self.userEnteredPrompt.text = @"You entered:";
    NSString *usersAnswer;
    if (self.currentNoteCount == 0)
    {
        usersAnswer = sender.titleLabel.text;
    }
    else
    {
        usersAnswer = [NSString stringWithFormat:@"%@ %@", self.userEnteredNotes.text, sender.titleLabel.text];
    }
    self.userEnteredNotes.text = usersAnswer;
    self.currentNoteCount++;

    // if user just entered the last note, display result
    if (self.currentNoteCount == self.currentExercise.noteCount)
    {
        if ([self.currentExercise.answer isEqualToString:usersAnswer])
        {
            self.successFailMessage.text = @"Congrats! You got it.";
        }
        else
        {
            self.successFailMessage.text = @"Sorry! answer is:";
            self.correctNotes.text = self.currentExercise.answer;
        }
    }
}

- (IBAction)nextPressed:(id)sender
{
    [self cleanupInputs];
    
    // select and setup the next exercise
}

- (IBAction)playNotes:(id)sender
{
    [self cleanupInputs];

    // AudioServicesPlaySystemSound(self.currentExercise.noteSound);
    [self.currentExercise playNotes];
}

- (void)cleanupInputs
{
    self.currentNoteCount = 0;
    self.userEnteredPrompt.text = @"";
    self.userEnteredNotes.text = @"";
    self.successFailMessage.text = @"";
    self.correctNotes.text = @"";
}


// Sample code
- (void)setCorrectResultWith
{
    NSString *text;
    UILabel *_label;
    
    if ([_label respondsToSelector:@selector(setAttributedText:)])
    {
        // iOS6 and above : Use NSAttributedStrings
        const CGFloat fontSize = 13;
        UIFont *boldFont = [UIFont boldSystemFontOfSize:fontSize];
        UIFont *regularFont = [UIFont systemFontOfSize:fontSize];
        UIColor *foregroundColor = [UIColor whiteColor];
        
        // Create the attributes
        NSDictionary *attrs = [NSDictionary dictionaryWithObjectsAndKeys:
                               boldFont, NSFontAttributeName,
                               foregroundColor, NSForegroundColorAttributeName, nil];
        NSDictionary *subAttrs = [NSDictionary dictionaryWithObjectsAndKeys:
                                  regularFont, NSFontAttributeName, nil];
        const NSRange range = NSMakeRange(8,12); // range of " 2012/10/14 ". Ideally this should not be hardcoded
        
        // Create the attributed string (text + attributes)
        NSMutableAttributedString *attributedText =
        [[NSMutableAttributedString alloc] initWithString:text
                                               attributes:attrs];
        [attributedText setAttributes:subAttrs range:range];
        
        // Set it in our UILabel and we are done!
        [_label setAttributedText:attributedText];
    } else {
        // iOS5 and below
        // Here we have some options too. The first one is to do something
        // less fancy and show it just as plain text without attributes.
        // The second is to use CoreText and get similar results with a bit
        // more of code. Interested people please look down the old answer.
        
        // Now I am just being lazy so :p
        [_label setText:text];
        
    }
}

#pragma mark - Lifecycle methods

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Do any additional setup after loading the view from its nib.

    UINavigationItem *navItem = self.navigationItem;
    navItem.title = [NSString stringWithFormat:@"%@ %d", @"Level", self.level];
    
    for (UIView *subview in self.view.subviews)
    {
        NSLog(@"subview for buttons: %@", subview);
        if ([subview isMemberOfClass:[UIView class]])
        {
            [self addButtonsLevel2:subview];
        }
    }
    
    // create notes array
    [self createNotesDictionary];

    // setup the starting exercise
    NSArray *notes = [NSArray arrayWithObjects:@"LA", @"SOL", @"FA", nil];
    self.currentExercise = [[SFEarTrainingExercise alloc] initWithNotes:notes
                                                        notesDictionary:self.notesDictionary];
    [self cleanupInputs];
}

- (void)createNotesDictionary
{
    NSMutableDictionary *notes = [NSMutableDictionary new];
    NSArray *noteTitleArray = [NSArray arrayWithObjects:@"LA", @"SOL", @"FA", @"MI", @"RE", @"DO", @"TI", nil];
    NSArray *noteSoundArray = [NSArray arrayWithObjects:@"la.wav", @"sol.wav", @"fa.wav", @"mi.wav", @"re.wav", @"do.wav", @"ti.wav", nil];
    for (int i = 0; i < 7; i++)
    {
        NSString *title = [noteTitleArray objectAtIndex:i];
        NSString *soundFile = [noteSoundArray objectAtIndex:i];
        SFNote *note = [[SFNote alloc] initWithNoteName:title
                                              soundFile:soundFile];
        [notes setObject:note forKey:note.noteName];
    }
    self.notesDictionary = notes;
}

- (void)addButtonsLevel2:(UIView *)view
{
    CGFloat y = 15.0;
    NSArray *noteTitleArray = [NSArray arrayWithObjects:@"LA", @"SOL", @"FA", @"MI", @"RE", @"DO", @"TI", nil];
    for (int i = 0; i < 7; i++)
    {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        CALayer *btnLayer = [button layer];
        [btnLayer setMasksToBounds:YES];
        [btnLayer setCornerRadius:20.0f];
		button.frame = CGRectMake(0.0, y, kStdButtonWidth, kStdButtonHeight);
        y += (kStdButtonHeight + 10);
        button.titleLabel.font = [UIFont systemFontOfSize:17];
        button.titleLabel.textColor = [UIColor redColor];
        NSString *title = [noteTitleArray objectAtIndex:i];
		[button setTitle:title forState:UIControlStateNormal];
		[button addTarget:self action:@selector(notePressed:) forControlEvents:UIControlEventTouchUpInside];
        button.backgroundColor = [UIColor cyanColor];
		
		button.tag = kViewTag;	// tag this view for later so we can remove it from recycled table cells
        [view addSubview:button];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidLayoutSubviews
{
    for (UIView *subview in self.view.subviews)
    {
        if ([subview hasAmbiguousLayout])
        {
            NSLog(@"Ambiguous: %@", subview);
        }
    }
}

@end
