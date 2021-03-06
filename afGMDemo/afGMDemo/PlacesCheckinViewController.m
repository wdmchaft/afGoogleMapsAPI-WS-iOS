//
//  PlacesCheckinViewController.m
//  afGMDemo
//
//  Created by adrien ferré on 06/10/11.
//  Copyright 2011 Ferré. All rights reserved.
//

#import "PlacesCheckinViewController.h"

@implementation PlacesCheckinViewController
@synthesize refTF;
@synthesize goBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationItem.title = @"Place checkin";
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setRefTF:nil];
    [self setGoBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (void)dealloc {
    [refTF release];
    [goBtn release];
    [super dealloc];
}
- (IBAction)goBtnPressed:(id)sender {
    if ([refTF.text isEqualToString:@""]){
        UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Error" message:@"You have to fill in the reference" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
        [al show];
        [al release];
        return;
    }
    
    afGMapsPlaceCheckinRequest *req = [afGMapsPlaceCheckinRequest request];
    BOOL useSensor = [[NSUserDefaults standardUserDefaults] boolForKey:@"Sensor"];
    
    [req setUseSensor:useSensor];
    req.reference = refTF.text;
    req.afDelegate = self;
    
    [req startAsynchronous];
}


#pragma mark ------------------------------------------
#pragma mark ------ TextField delegates
#pragma mark ------------------------------------------

-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    return YES;
}

#pragma mark ------------------------------------------
#pragma mark ------ afDelegate
#pragma mark ------------------------------------------

-(void) afPlaceCheckinWSStarted:(afGMapsPlaceCheckinRequest *)ws{
    
}

-(void) afPlaceCheckinWSSucceeded:(afGMapsPlaceCheckinRequest *)ws{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Success" message:@"You just checked in" delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];
}

-(void) afPlaceCheckinWSFailed:(afGMapsPlaceCheckinRequest *)ws withError:(NSError *)er{
    UIAlertView *al = [[UIAlertView alloc] initWithTitle:@"Error" message:er.description delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [al show];
    [al release];
}

@end