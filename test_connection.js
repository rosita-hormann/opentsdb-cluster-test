var TsdbClient = require('opentsdb-node-client');
var myTsdbClient = new TsdbClient({
    host: 'http://localhost',
    port: '8080'
});


myTsdbClient.version().then(function(r) {
    console.log(r)
    done();
});