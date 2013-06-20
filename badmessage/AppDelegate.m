//
//  AppDelegate.m
//  badmessage
//
//  Created by Eric Gorr on 6/20/13.
//  Copyright (c) 2013 Eric Gorr. All rights reserved.
//

#import "AppDelegate.h"
#import <MailCore/MailCore.h>


@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    NSBundle*   mainBundle  = [NSBundle mainBundle];
    NSString*   messagePath = [mainBundle pathForResource:@"29193" ofType:@"emlx"];
    
    NSLog( @"%@", messagePath );
    
    NSData*             emlxMessageData = [[NSData alloc] initWithContentsOfFile:messagePath];
    NSRange             dataRange       = NSMakeRange( 11, 108286 );
    NSData*             messageData     = [emlxMessageData subdataWithRange:dataRange];
    MCOMessageParser*   parser          = [MCOMessageParser messageParserWithData:messageData];
    MCOAbstractPart*    mainPart        = [parser mainPart];
    MCOAbstractMessage* message         = [mainPart message];
    MCOMessageHeader*   header          = [message header];
    
    NSLog( @"%@", [header subject] );
    NSLog( @"%u", [mainPart partType] );
    
    NSArray*    parts = [(MCOAbstractMultipart*)mainPart parts];
    
    NSLog( @"%@", parts );
}

@end
