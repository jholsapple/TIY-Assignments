//
//  TicketsTableViewController.m
//  07 -- Jackpot
//
//  Created by John Holsapple on 6/23/15.
//  Copyright (c) 2015 John Holsapple -- The Iron Yard. All rights reserved.
//

#import "TicketsTableViewController.h"
#import "Ticket.h"
#import "WinningTicketViewController.h"

@interface TicketsTableViewController()
{
    NSMutableArray *_tickets;
}

- (IBAction)addTickets:(UIBarButtonItem *)sender;

@end

@implementation TicketsTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _tickets = [[NSMutableArray alloc] init];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [_tickets count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"TicketsCell" forIndexPath:indexPath];
    
    // Configure the cell...
    
    Ticket *specificTicket = [_tickets objectAtIndex:indexPath.row];
    
     cell.textLabel.text = [NSString stringWithFormat:@"%@ %@ %@ %@ %@ %@", [specificTicket.picks objectAtIndex:0], specificTicket.picks[1], specificTicket.picks[2], specificTicket.picks[3], specificTicket.picks[4], specificTicket.picks[5]];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"ShowWinningTicketSegue"])
    {
        WinningTicketViewController *ticketsVC = (WinningTicketViewController *)[segue destinationViewController];
        
        ticketsVC.delegate = self;
    }
}


- (IBAction)addTickets:(UIBarButtonItem *)sender
{
    Ticket *anotherTicket =  [Ticket ticketUsingRandomNumbers];
    [_tickets addObject:anotherTicket];
    [self.tableView reloadData];
}

@end
