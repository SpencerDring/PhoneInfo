//
//  ViewController.m
//  PhoneInfo
//
//  Created by Spencer Dring on 23/05/2022.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
}


- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)ButtonPressed:(NSButton *)sender {
    NSString* apikeystring = [_APIKey stringValue];
    NSString* numbersearchstring = [_PhoneNumberToCheck stringValue];
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
       NSString * phoneinfourl = [[NSString alloc] initWithString:@"https://api.apilayer.com/number_verification/validate?number="];
       NSString * fullsearchurl = [phoneinfourl stringByAppendingString:numbersearchstring];
       [phoneinfourl release];
       NSLog(fullsearchurl);
    NSString *Post = [[NSString alloc] initWithFormat:@"{Page:0, Take:10}"];
    NSData *PostData = [Post dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];

    NSURL *url = [NSURL URLWithString:fullsearchurl];
    NSMutableURLRequest *req = [NSMutableURLRequest requestWithURL:url];
    [req setHTTPMethod:@"GET"];
    [req addValue:apikeystring forHTTPHeaderField: @"apikey"];
    [req setHTTPBody:PostData];

    NSData *res = [NSURLConnection  sendSynchronousRequest:req returningResponse:NULL error:NULL];
    NSString *myString = [[NSString alloc] initWithData:res encoding:NSUTF8StringEncoding];
    NSLog(@"%@", myString);
    
    _SearchResultStringDisplay.string = myString;
    
    [pool release];
}

@end
