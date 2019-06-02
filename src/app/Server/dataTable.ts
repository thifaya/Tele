export class HeartBeat {
    Name: string;
    SITEID: number;
    LastRXTimestamp: Date;
    Battery: number;
    GPRSConnected: boolean;
    GPRSOnLoginCheck: number;
    GPRSEnabled: boolean;
}

export class Alarm {
    SITEID: number;
    Name: string;
    Date: Date;
    Time: string; // test here
    Analog1: number;
}