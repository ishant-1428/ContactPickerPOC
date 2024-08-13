//
//  ViewController.m
//  ContactPickerPOC
//
//  Created by Ishant Chandna  on 08/08/24.
//

@import UIKit;
@import ContactsUI;

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(IBAction)btnContact:(id)sender{
    CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc] init];
    
    contactPicker.delegate = self;
    
    contactPicker.displayedPropertyKeys = @[CNContactPhoneNumbersKey];
    
    [self presentViewController:contactPicker animated:YES completion:nil];
}

-(void) contactPicker:(CNContactPickerViewController *)picker didSelectContactProperty:(nonnull CNContactProperty *)contactProperty {
    CNContact *contact= contactProperty.contact;
    NSString *identify = contactProperty.identifier;
    NSString *_lastDisplay = @"";
    for (CNLabeledValue<CNPhoneNumber*>* number in contact.phoneNumbers) {
        if([number.identifier isEqualToString:identify]){
            NSLog(@"Contacts: %@",contact);
            _lastDisplay = ((CNPhoneNumber *)number.value).stringValue;
            self.txtNumero.text = _lastDisplay;
        }
    }
}


@end
