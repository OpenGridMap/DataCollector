//
//  ConnectionHandler.h
//  DataCollector
//
//  Created by allen on 22/01/15.
//  Copyright (c) 2015 allen. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DataIterm.h"
#import "User.h"
/** This class is responsible for the connection to the server.
 
 It handles the connection to the server, via RESTkit and JSON.
 The class downloads the stations and the responsible pedelecs for the stations.
 It can also mockup station and pedelecs if the connection failes.
 
 */
@interface ConnectionHandler : NSObject

/*
 Singleton sharedConnectionHandler
 */
+ (ConnectionHandler *)sharedConnectionHandler;

/** Downloads all stations from the server.
 */
- (void)loadStationsWithCompletion:(void (^)(BOOL success))success;

/** Downloads all pedelecs for a specific station from the server.
 @param stationID StationID for the specific station.
 */
- (void)loadPedelecsForStationID:(int)stationID withCompletion:(void (^)(BOOL success))success;

/** Downloads all employees of nttdata from the server.
 */
- (void)loadEmployeesWithCompletion:(void (^)(BOOL success))success;

/** Downloads all active reservations of nttdata from the server.
 */
- (void)loadAllReservationsWithCompletion:(void (^)(BOOL success))success;

/** Downloads all reports of nttdata from the server.
 */
- (void)loadDamageReportsWithCompletion:(void (^)(BOOL success))success;

/** Send damage report to the server.
 */
- (void) sendReportToServer:(DataIterm *) dataIterm;

/** Sends a new Reservation for a pedelec to the server.
 @param pedelecID ID of the pedelec which wants to be reserved.
 @param employeeID ID of the employee (own user) who wants to reserve the pedelec.
 @param startDate Date of the begin of the reservation.
 @param endDate Date of the end of the reservation. For now it's an hour.
 @param resrvationID ID of the reservation.
 */
- (void)reservePedelec:(int)pedelecID forEmployee:(int)employeeID fromDate:(NSTimeInterval)startDate toDate:(NSTimeInterval)endDate withReservationID:(int)resrvationID WithCompletion:(void (^)(BOOL success))success;

/** Sends a changed Reservation Object for a pedelec to the server.
 @param resrvationID ID of the reservation.
 @param pedelecID ID of the pedelec which wants to be reserved.
 @param employeeID Date of the begin of the reservation.
 @param startDate Date of the begin of the reservation.
 @param resrvationID ID of the reservation.
 */
- (void)changeReservation:(int)reservationID ToPedelec:(int)pedelecID forEmployee:(int)employeeID fromDate:(NSTimeInterval)startDate toDate:(NSTimeInterval)endDate WithCompletion:(void (^)(BOOL success))success;

/** Sends a the login data to the server. Only required once.
 @param username String of the username.
 @param password MD5 Hash of the password.
 */
- (void)loginWithUsername:(NSString *)username password:(NSString *)password completion:(void (^)(BOOL success))success;

/** Sends the devicetoken for push notification services and the employee ID to the server.
 @param devicetoken String of the devicetoken for push notifications.
 */
- (void)sentDeviceToken:(NSString *)devicetoken completion:(void (^)(BOOL success))success;

/** Sends a transfer request for transferring reservation for a pedelec to the server.
 @param holderId ID of the current Holder of the reservation.
 @param myId ID of the logged-in employee.
 */
- (void)requestReservationFromHolder:(int)holderId myId:(int)myId completion:(void (^)(BOOL success))success;

/** Gets an Reservation Request for transferring a reservation for a pedelec from the server.
 @param holderId ID of the current Holder of the reservation.
 */
//- (void)getCurrentReservationRequestsForHolder:(int)holderId completion:(void (^)(Reservation *res))success;

/** Removes the pending Request for transferring a reservation for a pedelec from the server.
 @param reservationId ID of the the reservation of the pedelec.
 @param accepted Boolean wheater the reservation was passed or not.
 */
- (void)removeReservationRequestForReservation:(int)reservationId Accepted:(BOOL)accepted completion:(void (^)(BOOL success))success;

/** Sends a new damage report for a pedelec to the server.
 @param pedelecID ID of the pedelec having a dmage.
 @param employeeID ID of the employee (own user) reporting the damage.
 @param damageReason Reason of the damage / damaged part.
 @param damageDescription DDescription of the damage.
 @param damageReportID ID of the damage report.
 */
- (void)reportDamageForPedelec: (DataIterm *) dataIterm
                withCompletion: (void (^)(BOOL success))success;

+ (BOOL)demoModeIsActive;
+ (void)setDemoModeAcitve:(BOOL)active;

@end

