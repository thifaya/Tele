export class User {
    UserId: number;
    TitleId: number;
    Name: string;
    Surname: string;
    UserName: string;
    Password: string;
    ModifiedDate: Date;
    ModifiedUserId: number;
    IsActive: boolean;
    Email: string;
    DesignationID: number;
    MunicipalSiteID: number;
    UserAccessLevelId: number;
    Create_Update_User: boolean;
    Start_Stop_Pump: boolean;
    View_Financial_Report: boolean;
    Amend_Financial_Details: boolean;
}


export interface IDesignation {
    ID: number;
    Name: string;
    ModifiedDate: Date;
    ModifiedUserID: number;
    IsActive: boolean;
}

export interface ISite {
    Name: string;
    Analog1: string;
}

export interface ITitle {
    ID: number;
    Name: string;
    ModifiedDate: Date;
    ModifiedUserID: number;
    IsActive: boolean;
}


