//
//  FGStartupViewController.m
//  PlateCollect
//
//  Created by Finn Gaida on 08.09.13.
//  Copyright (c) 2013 Finn Gaida. All rights reserved.
//

#import "FGStartupViewController.h"
#import "NSString+MD5.h"
@implementation FGStartupViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	
    self.usernameLabel.delegate = self; self.usernameLabel.tag = 1;
    self.passwordLabel.delegate = self; self.passwordLabel.tag = 2;
    self.hometownLabel.delegate = self; self.hometownLabel.tag = 3;
}

- (void)saveAll {
    
    NSUserDefaults *d = [NSUserDefaults standardUserDefaults];
    [d setObject:self.usernameLabel.text forKey:@"username"];
    [d setObject:self.passwordLabel.text forKey:@"password"];
    [d setObject:self.hometownLabel.text forKey:@"hometown"];
    
    [[[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://finngaida.de/platecollect/addUser.php?name=%@&password=%@&hometown=%@", self.usernameLabel.text, self.passwordLabel.text, self.hometownLabel.text]]] delegate:nil] start];
    
    
    // I would be in favor of hashing the password here already as this is not an HTTPS connection.
    //[[[NSURLConnection alloc] initWithRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"http://finngaida.de/platecollect/addUser.php?name=%@&password=%@&hometown=%@", self.usernameLabel.text, [self.passwordLabel.text MD5String], self.hometownLabel.text]]] delegate:nil] start];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    switch (textField.tag) {
        case 1: {
            [self.usernameLabel resignFirstResponder];
            [self.passwordLabel becomeFirstResponder];
            self.passwordLabel.text = @"";
        } break;
        case 2: {
            [self.passwordLabel resignFirstResponder];
            [self.hometownLabel becomeFirstResponder];
            self.hometownLabel.text = @"";
        } break;
        case 3: {
            [self.hometownLabel resignFirstResponder];
            [self hide:self];
        } break;
        default:return YES; break;
    }
    return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hide:(id)sender {
    [self saveAll];
    //[self performSegueWithIdentifier:@"hideSignup" sender:self];
    //[self.navigationController popViewControllerAnimated:YES];
    [self.delegate startupViewControllerDidFinish:self];
}
@end
