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

export class AccessLevel {
    UserAccessLevelId: number;
    Description: string
    Synopsis: string;
    ModifiedDate: Date;
    ModifiedUserId: number;
    IsActive: boolean;
}

export class Years {
    YearID: number;
    Name: string;
}
