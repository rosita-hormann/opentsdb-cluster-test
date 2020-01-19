var TsdbClient = require('opentsdb-node-client');
var myTsdbClient = new TsdbClient({
    host: 'http://localhost',
    port: '4242'
});
currentDate = new Date().getTime()
for(var i = 0; i<1000; i++){
    myTsdbClient.putMetric(
        'example', // metric name
        currentDate, // timestamp
        Math.floor(Math.random() * 1000), { // measured value and its tags
            host: "host_example",
            bit: Math.floor(Math.random() * 1000) % 2
        }
    ).then(function() {
        console.log('putMetric', r);
    });
    currentDate = currentDate  + 500
}
