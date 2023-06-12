# mytomcat

tomcat installation using dockerfile

To build the above file 
docker build -t testtomcat .

To run  
docker run -itd -p 8080:8080 --name tomcatweb testtomcat
