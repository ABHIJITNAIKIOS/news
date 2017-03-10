//
//  ViewController.h
//  panexample
//
//  Created by MAC on 10/03/17.
//  Copyright © 2017 MAC. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource, UITableViewDelegate>{
    NSDictionary *dict, *dict2;
    
    NSArray *array;
    
    
    
}
@property (weak, nonatomic) IBOutlet UITableView *table;
- (IBAction)sort:(id)sender;


@end

