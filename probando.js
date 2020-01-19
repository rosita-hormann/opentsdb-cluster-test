var TsdbClient = require('opentsdb-node-client');
var myTsdbClient = new TsdbClient({
    host: 'http://localhost',
    port: '4242'
});


myTsdbClient.version().then(function(r) {
    console.log(r)
    done();
});