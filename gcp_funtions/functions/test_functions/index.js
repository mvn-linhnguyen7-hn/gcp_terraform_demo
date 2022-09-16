var Compute = require('@google-cloud/compute');

var compute = Compute();

exports.startInstance = function startInstance(req, res) {

    var zone = compute.zone('asia-south1-c');

    var vm = zone.vm('duo');

    vm.start(function(err, operation, apiResponse) {

        console.log('instance start successfully');

    });

res.status(200).send('DUO has Started!!');

};
