//
//  ViewController.h
//  PhoneInfo
//
//  Created by Spencer Dring on 23/05/2022.
//

#import <Cocoa/Cocoa.h>

@interface ViewController : NSViewController

@property (strong) IBOutlet NSTextField *APIKey;

@property (strong) IBOutlet NSTextField *PhoneNumberToCheck;

@property (assign) IBOutlet NSTextField *SearchResultString;

@property (assign) IBOutlet NSTextView *SearchResultStringDisplay;

@end

