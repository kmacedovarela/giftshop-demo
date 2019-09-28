'use strict';

// Import the firebase-functions package for deployment.
const functions = require('firebase-functions');

// Import the Dialogflow module from the Actions on Google client library.
const {dialogflow} = require('actions-on-google');

const bodyParser = require('body-parser')
var request = require("request").defaults({ family: 4 });
var rp = require("request-promise");

// Instantiate the Dialogflow client.
const app = dialogflow({debug: true});

// App code

//process server data
var kieserver_host = "http://a2738a03.ngrok.io"
var kieserver_url = kieserver_host+"/kie-server/services/rest/server"
var process_container="GiftShop"
var process_id= "GiftShop.NewOrder"
var process_instance_id;

// Handle the Dialogflow intent named 'buy gift'.
// The intent collects a parameters named 'gift' and 'address' and starts a new process within jBPM.
app.intent('buy gift', (conv, {presente,endereco}) => {
    var address= endereco;
    var gift = presente;

    console.log("1. Starting. Url called: "+kieserver_url+"/containers/"+process_container+"/processes/"+process_id+"/instances");
    console.log("1. Using address: "+address+"and "+gift);
    var order_id; 
 
    var start_process_options = {
        method: 'POST',
        headers: {
            "content-type": "application/json",
            "Authorization": "Basic a2FyaW5hOmFzZGFzZGFzZA=="
        },
        uri: kieserver_url+"/containers/"+process_container+"/processes/"+process_id+"/instances",
        body:{
            "gift":{
                "Gift":{
                    "type": gift,
                    "deliveryAddress": address
                    }
                }
            },
        json: true // Automatically stringifies the body to JSON
    };
    
    const asyncProcessStart = () => new Promise(resolve => {
    
        console.log("Async Process Start");
        
        rp(start_process_options).then((parsedBody) => {
            // POST succeeded...
            console.log("3. Sucess on starting process on kie server. Body: "+parsedBody);
            sleep(1000);

            process_instance_id = parsedBody;
           	return resolve(process_instance_id);
        })
        .catch((err) => {
            // POST failed...
            console.log("Error on kie server request: "+err);
        })
    });

    // defines the parameters to invoke jBPM rest api and obtain process variable details
    const asyncObtainVariableValues = (pid) => new Promise(resolve => {
        var get_process_variable_options = {
            method: 'GET',
            headers: {
                "content-type": "application/json",
                "Authorization": "Basic a2FyaW5hOmFzZGFzZGFzZA=="
            },
            uri: kieserver_url+"/containers/"+process_container+"/processes/instances/"+pid+"/variables",
        };

        console.log("Obtaining Variable Values ");
        rp(get_process_variable_options)
        .then((parsedBody) => {
            // POST succeeded...
            console.log("Sucess on obtaining variables from kie server. Body: "+parsedBody);
            sleep(1000);

            //  parsedBody will be the process variables map, i.e. name = value
           return resolve(JSON.parse(parsedBody));
        })
        .catch((err) => {
            // POST failed...
            console.log("Error on kie server request: "+err);
        });
    });

    // Executing async request to jBPM
    var variableResult = asyncProcessStart()
        .then( (result) => {
                    order_id = result;
                    return asyncObtainVariableValues(order_id)
        }).then( (variables) => {
            console.log("Returning response to google");

            var giftDetails = variables["gift"]["com.example.giftshop.Gift"];
            return conv.close('Obrigada! '+
                        ' O presente será embalado e enviado com carinho para ' + giftDetails.deliveryAddress +'.'+
                        ' Você será cobrado um valor total de: '+(giftDetails.price+giftDetails.deliveryFee) +' reais,'+
                        ' Acompanhe seu pedido através do número '+ order_id +'. ');
        });

    console.log(" Ending... ");
    
    return variableResult;

});

/*
{
  "initiator" : "kieserver",
  "order" : {
  "org.kvarela.model.Order" : {
    "address" : "ipanema",
    "flavor" : "chocolate",
    "phone" : null,
    "price" : 30.0,
    "time" : 15,
    "discount" : null
  }
}
} */

function sleep(milliseconds) {
  var start = new Date().getTime();
  for (var i = 0; i < 1e7; i++) {
    if ((new Date().getTime() - start) > milliseconds){
      break;
    }
  }
}

// Set the DialogflowApp object to handle the HTTPS POST request.
exports.dialogflowFirebaseFulfillment = functions.https.onRequest(app);
