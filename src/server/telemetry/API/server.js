var express = require('express');
var app = express();
const bodyParser = require('body-parser');

//const Cors = require("cors");

// parse application/json
app.use(bodyParser.json());
//app.use(Cors());


    // config for your database
    var config = {
        user: 'sa',
        password: '*1@dministrator',
        server: '154.0.172.85', 
        database: 'Telemetry' 
    };

app.get('/users', function (req, res) {
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXEC User_All', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordsets[0]);
            sql.close();
        });
    });
});

app.post('/login', function (req, res) {
  
    var sql = require("mssql");
    var username = req.body.username
    var password = req.body.password
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records "+ req.body.password +"
        request.query("select * from Security.Users WHERE UserName ='"+ username +"' AND Password = '"+ password +"' ", function (err, recordset) {
            if (err){
                console.log(err);
                throw new Error('ERROR')
             } else {
                 
            // send records as a response
            res.send(recordset.recordsets[0]);
            console.log('username: '+ req.body.username + ' Password: '+ req.body.password )
                 
             }
            sql.close();
        });

       
    });
});

app.get('/title', function (req, res) {   
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from Lookup.Title', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordsets[0]);
            sql.close()
        });

       ;
    });
});

app.get('/accessLevel', function (req, res) {
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from Lookup.UserAccessLevels', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});


app.get('/designation', function (req, res) {
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from Lookup.Designation', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordsets[0]);
            sql.close();
        });

       
    });
});


app.get('/multiyeartrendreceived', function (req, res) {
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXEC dbo.MultiYearReceivedTrend', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});


app.get('/multiyeartrendconsumed', function (req, res) {
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXEC dbo.MultiYearConsumedTrend', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});

app.get('/yearlywaterconsumed', function (req, res) {
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXEC dbo.YearlyWaterConsumed', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});


app.get('/yearlywaterreceived', function (req, res) {
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('EXEC dbo.YearlyWaterReceived', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});

app.get('/finance', function (req, res) {
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from Financial.WaterPrices', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});


app.get('/year', function (req, res) {
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log('err');
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from Lookup.Year', function (err, recordset) {
            if (err) console.log('err222')
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});

app.post('/alarms', function (req, res) {
    var date = req.body.date
    var siteId = req.body.siteId
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.AlarmTable @MyDate2 =  '"+ date +"', @mySITEID =  '"+ siteId +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('date: '+ date + ', siteId: ' + siteId)
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});

app.post('/volumetrendreceived', function (req, res) {
    var date = req.body.date
    var siteId = req.body.siteId
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.VolumeTrendRecieved   @myDate =  '"+ date +"', @mySite =  '"+ siteId +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('date: '+ date + 'siteId: ' + siteId)
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});

app.post('/volumetrendconsumed', function (req, res) {
    var date = req.body.date
    var siteId = req.body.siteId
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.VolumeTrendConsumed @myDate =  '"+ date +"', @mySite =  '"+ siteId +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('date: '+ date + ', siteId: ' + siteId)
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});

app.post('/aggregateconsumed', function (req, res) {
    var month = req.body.month
    var year = req.body.year
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.AggregateConsumedWater   @mymonth =  '"+ month +"', @myYear =  '"+ year +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('month: '+ month + ', year: ' + year)
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});


app.post('/leveltrends', function (req, res) {
    var date = req.body.date
    var siteId = req.body.siteId
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.p_DailyLevelTrends_tbs   @Date =  '"+ date +"', @SiteId =  '"+ siteId +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('date: '+ date + ', siteId: ' + siteId)
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});

app.post('/aggregatereceived', function (req, res) {
    var month = req.body.month
    var year = req.body.year
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.AggregateReceivedWater   @mymonth =  '"+ month +"', @myYear =  '"+ year +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('month: '+ month + ', year: ' + year)
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
});


app.post('/comparemonthtomonth', function (req, res) {
    var month = req.body.month
    var year1 = req.body.year1
    var year2 = req.body.year2
    var compareMonth = []
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.MonthToMonthCompare   @mymonth =  '"+ month +"', @myYear =  '"+ year1 +"', @myYear2 =  '"+ year2 +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('month: '+ month + ', year1: ' + year1 + ', year2: ' + year2)
            for (var i = 0; i < recordset.recordsets.length; i++) {
                compareMonth.push(recordset.recordsets[i]);
              }

            res.send(compareMonth);    
            console.log(recordset.recordsets.length)
            sql.close();
        });

       
    });
});


app.post('/monthlytrend', function (req, res) {
    
    var month = req.body.month
    var siteId = req.body.siteId
    var trend = req.body.trend
    
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.MonthlyTrend   @Trend =  '"+ trend +"', @SiteId =  '"+ siteId +"', @Month =  '"+ month +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log(' month: ' + month + ', siteId: ' + siteId + ', trend: ' + trend )                          

            res.send(recordset.recordset);    
            sql.close();
        });

       
    });
});


app.post('/carltonvilleflowrate', function (req, res) {
    
    var date = req.body.date
    var FlowRateTrend = []
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.CarltonvilleFlowRateTrend   @mydate =  '"+ date +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log(' date: ' + date )
            console.log(' length: ' + recordset.recordsets.length )    
            
            for (var i = 0; i < recordset.recordsets.length; i++) {
                FlowRateTrend.push(recordset.recordsets[i]);
              }

            res.send(FlowRateTrend);    
            sql.close();
        });

       
    });
});


app.post('/fochvilleflowrate', function (req, res) {
    
    var date = req.body.date
    var FlowRateTrend = []
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.FochvilleFlowRateTrend   @mydate =  '"+ date +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log(' date: ' + date )    
            
            for (var i = 0; i < recordset.recordsets.length; i++) {
                FlowRateTrend.push(recordset.recordsets[i]);
              }

            res.send(FlowRateTrend);    
            sql.close();
        });

       
    });
});



app.post('/compareyeartoyear', function (req, res) {
    
    var year1 = req.body.year1
    var year2 = req.body.year2
    var compareYear = []
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query("EXEC dbo.YearToYearCompare   @myYear =  '"+ year1 +"', @myYear2 =  '"+ year2 +"' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log(' year1: ' + year1 + ', year2: ' + year2)
            for (var i = 0; i < recordset.recordsets.length; i++) {
                compareYear.push(recordset.recordsets[i]);
              }

            res.send(compareYear);    
            sql.close();
        });

       
    });
});

// used for the drop down list in almost all pages
app.get('/allsites', function (req, res) {
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records                                <>
        request.query(" select Name, SITEID, SiteNumber, CellNo from dbo.CM_SITE WHERE Name <> 'Energy Test' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            sql.close();
        });

       
    });
}); 

// used only on users page
app.get('/site', function (req, res) {
    
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records
        request.query('select * from dbo.TBS_Site', function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordsets[0]);
            sql.close();
        });

   
    });
});


app.get('/heartbeat', function (req, res) {
  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records                                <>
        request.query(" select DISTINCT SITEID,Name, Battery, Counter8, GPRSConnected, LastRXTimestamp from dbo.Heart_Beat_View ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            res.send(recordset.recordset);
            
            sql.close();
        });

       
    });
}); 


app.put('/activateuser/:id', function (req, res) {    
  
    var activate =  req.body.activate
        
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records

        
        if( activate ) {
            
       request.query(" UPDATE Security.Users SET IsActive='" + false + "' WHERE UserId= '" + req.params.id  + "' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('id: ' + req.body.userId)

            res.send('USER DEACTIVATED');    
            sql.close();
        });
            
        } else {
            
       request.query(" UPDATE Security.Users SET IsActive='" + true + "' WHERE UserId= '" +  req.params.id + "' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('id: ' + req.body.userId)

            res.send('USER ACTIVATED');    
            sql.close();
        });
            
        }
               
    });
});


app.put('/activate/:id', function (req, res) {

      var id = req.params.id  
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records

       request.query(" UPDATE Security.Users SET IsActive='" + true + "' WHERE UserId= '" +  req.params.id + "' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('id: ' +id)

            res.send('USER ACTIVATED');    
            sql.close();
        });
        
               
    });
});

app.put('/deactivate', function (req, res) {
    
    
        
    var sql = require("mssql");
    // connect to your database
    sql.connect(config, function (err) {
        if (err) console.log(err);
        // create Request object
        var request = new sql.Request();
        // query to the database and get the records

            
       request.query(" UPDATE Security.Users SET IsActive='" + false + "' WHERE UserId= '" + req.body.userId + "' ", function (err, recordset) {
            if (err) console.log(err)
            // send records as a response
            console.log('id: ' + req.body.userId)

            res.send('USER DEACTIVATED');    
            sql.close();
        });
            
               
    });
});



var server = app.listen(5000, function () {
    console.log('Server is running..');
});