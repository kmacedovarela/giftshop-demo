Gift Shop - jBPM + Google Actions Demo
=============================

This is a demo that demonstrates a business oriented simple application with low-code development approach. It involves business processes and rules using BPMN and Decision Tables. Usage sample with images at the end of this file.

jBPM is open source software, released under the Apache Software License. It is written in 100% pure Java™, runs on any JVM and is available in the Maven Central repository too.  Red Hat Process Automation Manager [RHPAM](https://developers.redhat.com/products/rhpam/download) is the enterprise version of jBPM and can be downloaded and used freely by developers. 

In this sample, Google Assistant can be used to order a gift. The request will be handled by a process engine in jBPM, and the item price + delivery fee will be calculated according to the business rules (decision tables). 

Google Assistant informs the customer of the total price which consists of the item cost plus the delivery time. 

## Pre-reqs
- Java 8
- MySQL
- [RHPAM 7.4.0](https://developers.redhat.com/products/rhpam/download)
- Firebase console (with subscription that allows requests to external environments)

## Installation

To test this project its necessary to start jBPM, import business project, deploy it.  Import the google assistant project to dialogflow and deploy the NodeJS function to firebase. 

*For now, this file describes a local install without OpenShift*

# MySQL

1. Start Docker Container

~~~
docker run --rm --name mysql-jbpm -e MYSQL_ROOT_PASSWORD=admin -e MYSQL_DATABASE=mydb -e MYSQL_USER=jbpmuser -e MYSQL_PASSWORD=jbpmpassword -p 3306:3306  -v $HOME/docker/opt/db/mysql:/var/lib/mysql -d mysql:5.7
~~~

1. Configure EAP:

~~~
                <datasource jndi-name="java:jboss/MySqlDS" pool-name="MySqlDS" enabled="true">
                    <connection-url>jdbc:mysql://localhost:3306/mydb</connection-url>
                    <driver-class>com.mysql.jdbc.Driver</driver-class>
                    <driver>mysql-connector-java-5.1.48.jar_com.mysql.jdbc.Driver_5_1</driver>
                    <security>
                        <user-name>jbpmuser</user-name>
                        <password>jbpmpassword</password>
                    </security>
                    <validation>
                        <valid-connection-checker class-name="org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLValidConnectionChecker"/>
                        <background-validation>true</background-validation>
                        <exception-sorter class-name="org.jboss.jca.adapters.jdbc.extensions.mysql.MySQLExceptionSorter"/>
                    </validation>
                </datasource>
~~~


## RHPAM 

1. Start RHPAM with this ( _non recomended for prod_ ) property.

~~~
$EAP_HOME/bin/standalone.sh -Dcom.arjuna.ats.arjuna.allowMultipleLastResources=true
~~~

1. Import to Business Central `GiftShop` application; 

1. Open the `GiftShop` project, and click on deploy. RHPAM will build and deploy the project on Kie Server. A new kie container will be created to handle the process and rules in this project;

## Creating the Google Assistant project

The `gift-shop.zip` project, contains a zip file that has the intents and fullfilment configurations. All it's required to do is import this zip file into a dialogflow project.

It contains also a simple node.js script (in `giftshop-function`) used by google assistant to reach the Kie Server via rest API. On this demo, the script runs on the cloud with firebase functions, and tries to reach the Kie Server http address. 

Since google assistant runs on the internet, you need to expose your kie containers urls to so the node.js client on firebase can be able to reach it. For local tests, you can use [ngrok](https://ngrok.com/) to create a tunnel and expose kie server. 

1. Download ngrok and start it with:

~~~
./ngrok http 8080
~~~ 

1. Identify the external URL Address and update the node.js client `giftshop-function/functions/index.js`, variable `kieserver_host`.
1. Redeploy it using firebase command line tool:

~~~
firebase deploy
~~~

Here are some tips on firebase usage:

- `firebase list` - List your available projects
- `firebase deploy --project pizza-order-XPT0` - Deploy the new version of your script

# Using it

Start a simulation on your dialogflow console and enjoy sending gifts to your friends. 

![Image of Google Assistant](https://github.com/kmacedovarela/giftshop-demo/blob/master/images/google-actions.png)

Google assistant started a new process via the Node JS client available on firebase. The NodeJS client executed a rest call to Kie Server with the input collected from the user. A new Order process will be started.

![Image of Business Process](https://github.com/kmacedovarela/gift-shop/blob/master/images/business-process.png)

The price and value informed to the customer, were calculated dinamicaly by business rules defined in decision tables.

![Image of Decision Table](https://github.com/kmacedovarela/giftshop-demo/blob/master/images/decision-table.png)

The human tasks have forms which can be obtained and embedded in external apps

![Image of Human Task Form](https://github.com/kmacedovarela/giftshop-demo/blob/master/images/task-form.png)

Change the value of a business rule, click on deploy in Business Central, and try to order the same Gift using Google Actions. The new rule will be imediatelly used. 

