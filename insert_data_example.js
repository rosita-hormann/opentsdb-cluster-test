var TsdbClient = require('opentsdb-node-client');
var myTsdbClient = new TsdbClient({
    host: 'http://localhost',
    port: '8080'
});
currentDate = new Date().getTime()

for(var i = 0; i<3600; i++){
    myTsdbClient.putMetric(
        'other1', // metric name
        currentDate, // timestamp
        Math.floor(Math.random() * 1000), { // measured value and its tags
            host: "host_example",
            bit: Math.floor(Math.random() * 1000) % 2
        }
    )
    .then(r => console.log('putMetric', r)
    .then(e => console.error(e))
    );
    currentDate = currentDate  + 1000

}
