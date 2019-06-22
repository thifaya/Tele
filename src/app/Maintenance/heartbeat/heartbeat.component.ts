import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DataService } from 'src/app/Service/data.service';



@Component({
  selector: 'app-heartbeat',
  templateUrl: './heartbeat.component.html',
  styleUrls: ['./heartbeat.component.css']
})
export class HeartbeatComponent implements OnInit {

  results;
  visible = true
  Status; status_value;
  row;
  x: number; y: number
  heartbeats = [];
  legend
  SITES
  provinceDropdown; municipalityDropdown;
  districtDropdown; siteDropdown

  constructor(private router: Router, private _dataService: DataService) {
    this._dataService.getAllSite()
      .subscribe(site => {
        this.SITES = site;


        this._dataService.getHeartbeat()
        .subscribe(res => {
          this.results = res
  
          if (this.results.length > 0) {
            // finishing heart beat table
  
  
            for (this.x = 0; this.x < this.results.length; this.x++) {
              for (this.y = 0; this.y < this.results[this.x].length; this.y++) {
  
                this.heartbeats.push({ 'Name': this.results[this.x][this.y].Name, 'GPRSConnected': this.results[this.x][this.y].GPRSConnected, 'LastRXTimestamp': this.results[this.x][this.y].LastRXTimestamp, 'Battery': this.results[this.x][this.y].Battery, 'Counter8': this.results[this.x][this.y].Counter8, 'Legend': '../assets/ImageView/' + this.results[this.x][this.y].GPRSConnected + '.PNG' })
              }
            }
  
  
            console.log(this.heartbeats)
  
          } else {
  
          }
        },
          err => console.log(err))


      },
        err => console.log(err))
  }
  heartbeatPath: any = '../assets/ImageView/heartbeat.PNG';
  legendPath: any;
  ngOnInit() {

    this.districtDropdown = document.querySelector('#ddldistrict')
    this.provinceDropdown = document.querySelector('#ddlprovince')
    this.municipalityDropdown = document.querySelector('#ddlmunicipality')
    this.siteDropdown = document.querySelector('#ddlSite')

   /**
    * this.districtDropdown.disabled = true
    this.municipalityDropdown.disabled = true
    this.siteDropdown.disabled = true
    */

    

    
    if (localStorage.getItem('UserId') === null) {
      //  this.router.navigate(['/']);
    }
    if (sessionStorage.getItem('UserId') === null) {
      //  this.router.navigate(['/']);
    }

  }



  dropDownEnabled() {


    if (this.provinceDropdown.value == '') {

      this.districtDropdown.value = ''
      this.siteDropdown.value = ''
      this.municipalityDropdown.value = ''

      this.districtDropdown.disabled = true
      this.siteDropdown.disabled = true
      this.municipalityDropdown.disabled = true


    } else {
      this.districtDropdown.disabled = false
    }


    console.log('Selected= ' + !this.districtDropdown.disabled)
  }

  districtEnable() {

    if (this.districtDropdown.value == '') {

      this.siteDropdown.value = ''
      this.municipalityDropdown.value = ''

      this.siteDropdown.disabled = true
      this.municipalityDropdown.disabled = true

    } else {
      this.municipalityDropdown.disabled = false
    }
  }

  localEnable() {

    if (this.municipalityDropdown.value == '') {

      this.siteDropdown.value = ''

      this.siteDropdown.disabled = true

      if (this.siteDropdown.value == '') {
        console.log('siteDropdown null')
      } else {
        console.log('get value')
      }
    } else {
      this.siteDropdown.disabled = false
    }
  }

  viewReport() {
    //  swal("Hello world!");



    if (this.siteDropdown.value == "") {
      console.log('NULL VALUES')
      // this.notFound = true;
      this.visible = false;
    } else {


      if (this.siteDropdown.value == "All") {

        this._dataService.getHeartbeat()
          .subscribe(res => {
            this.results = res

            if (this.results.length > 0) {
              // finishing heart beat table

              this.heartbeats = [];
              for (this.x = 0; this.x < this.results.length; this.x++) {
                for (this.y = 0; this.y < this.results[this.x].length; this.y++) {

                  this.heartbeats.push({ 'Name': this.results[this.x][this.y].Name, 'GPRSConnected': this.results[this.x][this.y].GPRSConnected, 'LastRXTimestamp': this.results[this.x][this.y].LastRXTimestamp, 'Battery': this.results[this.x][this.y].Battery, 'Counter8': this.results[this.x][this.y].Counter8, 'Legend': '../assets/ImageView/' + this.results[this.x][this.y].GPRSConnected + '.PNG' })
                }
              }


              console.log(this.heartbeats)
              this.visible = true;

            } else {

            }
          },
            err => console.log(err))


      } else {
        console.log(this.siteDropdown.value)
        this._dataService.getSingleHeartbeat(this.siteDropdown.value)
          .subscribe(res => {
            this.results = res

            this.heartbeats = []
            for (this.y = 0; this.y < this.results.length; this.y++) {

              this.heartbeats.push({ 'Name': this.results[this.y].Name, 'GPRSConnected': this.results[this.y].GPRSConnected, 'LastRXTimestamp': this.results[this.y].LastRXTimestamp, 'Battery': this.results[this.y].Battery, 'Counter8': this.results[this.y].Counter8, 'Legend': '../assets/ImageView/' + this.results[this.y].GPRSConnected + '.PNG' })
            }

            
        this.visible = true;

          }, err => console.log(err))


      }

    }

  }

}


/**
 *
 * {{ heartbeat.Name }}</td>
      <td>{{ heartbeat.GPRSConnected }}</td>
      <td>{{ heartbeat.LastRXTimestamp }}</td>
      <td>{{ heartbeat.Battery }}</td>
      <td>{{ heartbeat.Counter8 }}



          <table class="table1" cellspacing="0" cellpadding="0"  >
    <tbody>
      <tr>
        <td colspan="3">
          <div class="myDiv">
            <div>
              <table class="table2" cellspacing="0" cellpadding="0">
                <tbody>
                  <tr>
                    <td style="width: 100%;height: 100%">

                      <table>
                        <tbody>

                          <!-- Compalsary row-->

                          <tr isparameterrow="true">
                            <td style="padding:5px;"><span style="font-family:Verdana;font-size:8pt;">Select
                                Province:</span></td>
                            <td style="padding:5px;padding-right:0px;">
                              <div>
                                <select class="ddlprovince" id="ddlprovince" (change)="dropDownEnabled()" >
                                  <option selected="selected" value="" >&lt;Select&nbsp;a&nbsp;Value&gt;</option>
                                  <option value="0" >All</option>
                                  <option value="1~gauteng"  >Gauteng</option>
                                </select>
                              </div>
                            </td>

                          </tr>
                          <tr isparameterrow="true">
                            <td style="padding:5px;"><span style="font-family:Verdana;font-size:8pt;">Select District or
                                Metropolitan Municipality:</span></td>
                            <td style="padding:5px;padding-right:0px;">
                              <div>
                                <select class="ddldistrict" id="ddldistrict" required  (change)="districtEnable()" >
                                  <option selected="selected" value="">&lt;Select&nbsp;a&nbsp;Value&gt;</option>
                                  <option value="0">All</option>
                                  <option value="1~west_rand" >West Rand</option>
                                  
                                </select>
                              </div>
                            </td>
                          </tr>
                          <tr isparameterrow="true">
                            <td style="padding:5px; "><span style="font-family:Verdana;font-size:8pt;">Select Local
                                Municipality:</span></td>
                            <td style="padding:5px;padding-right:0px;">
                              <div>
                                <select class="ddlmunicipality" id="ddlmunicipality" name="municipality" required  (change)="localEnable()">
                                  <option selected="selected" value="">&lt;Select&nbsp;a&nbsp;Value&gt;</option>
                                  <option value="0">All</option>
                                  <option value="1~merafong"  >Merafong City</option>
                                </select>
                              </div>
                            </td>
                          </tr>

                          <tr isparameterrow="true">
                            <td style="padding:5px;"><span style="font-family:Verdana;font-size:8pt;">Select
                                Site:</span></td>
                            <td style="padding:5px;padding-right:0px;">
                              <div>
                                <select class="ddlSite" id="ddlSite" name="site" required>
                                  <option selected="selected" value="">&lt;Select&nbsp;a&nbsp;Value&gt;</option>
                                  <option value="All">All</option>
                                  <option *ngFor="let site of SITES" value="{{site.SITEID}}">{{site.Name}}</option>

                                </select>
                              </div>
                            </td>
                            <td>

                            </td>

                          </tr>
                          
                          
                          <!-- /Compalsary row -->
                        </tbody>
                      </table>
                    </td>


                  </tr> 
                  <tr style="margin-top: 1px;padding-bottom: 1px">
                    <td class="buttoncell">
                      <table>
                        <tbody>
                          <tr>
                            <td><input type="submit" class="btnreport" id="btnreport" value="View Report"
                                (click)="viewReport()"></td>
                          </tr>
                        </tbody>
                      </table>
                    </td>
                  </tr>

                </tbody>
              </table>
            </div>
          </div>
        </td>
      </tr>
      <tr style="height:6px;font-size:2pt;">
        <td class="cellblock" colspan="3">
          <div>
            <input type="hidden"><input type="hidden" value="false">
          </div>
        </td>
      </tr>
      <tr style="display:none;"></tr>
      <tr>
        <td style="width: 25%; height: 100%; vertical-align: top; display: none;">
          <div style="width:100%;height:100%;">
            <span>
              <div style="display:none;">
                <input type="hidden">
              </div>
            </span>
          </div>
        </td>
        <td
          style="margin: 0px; padding: 0px; width: 4px; height: 100%; vertical-align: middle; display: none; background-color: rgb(236, 233, 216);">
          <div>
            <input type="hidden"><input type="hidden" value="false">
          </div>
        </td>
        <td style="height: 100%; vertical-align: top;">
          <div style="height:100%;width:100%;overflow:auto;position:relative;">
            <div style="height:100%;display:none;"></div>
            <div>
              <div style="visibility:none;" fornonreportcontentarea="false"
                newcontenttype="Microsoft.Reporting.WebFormsClient.ReportAreaContent.None">
                <input type="hidden" value="None">
              </div><input type="hidden"><span></span>
              <div style="display:none;">
                <span></span><input type="hidden"><input type="hidden"><input type="hidden" value="100">
              </div>
              <div style="width: 100%; height: 100%; display: none;">

              </div>
            </div>
          </div>
        </td>
      </tr>
    </tbody>
  </table>
 *
 *
 * Battery: "13.5"
CellNo: "+27726278031"
Charger: "0.0"
Counter8: "0.0"
Date: "2013/10/22"
FromSiteID: 23
GPRSConnected: false
GPRSEnabled: true
GPRSOnLoginCheck: 1
LastRXTimestamp: "2014-02-05 11:36:16"
Name: "Wedela Small"
ReceiveID: 64037
SITEID: 23
SiteNumber: "MCLM006"
TheDateTimeStamp: "2013-05-03T08:22:17.830Z"
Time: "09:54:44"
 */