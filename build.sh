#!/bin/bash

cd ../.. ;
git clone https://github.com/TIBCOSoftware/mashling-cicd.git ;
pwd ;
mkdir -p tmp ;
ls ;
echo "alert 1";
pwd ;
cp -r mashling-cicd/sample-recipes/builds/latest/rest-conditional-gateway/rest-conditional-gateway-linux.zip ./tmp
echo "alert 2" ;
cd tmp ;
ls ;
pwd ;
echo "alert 3" ;
chmod 755 rest-conditional-gateway-linux.zip ;
echo "alert 4" ;
unzip -o rest-conditional-gateway-linux.zip ;
echo "alert 5" ;
ls ;
pwd ;
echo "alert 6" ;
#./rest-conditional-gateway-linux & HTTP_STATUS="$(curl -i http://localhost:9096/pets/40 | grep HTTP )"  ;


function test {
  ./rest-conditional-gateway-linux & RESPONSE=$(curl -so /dev/null -w "%{http_code}\n" ${1})
  if [[ $RESPONSE = 200 ]]; then
    echo "Success with ${RESPONSE} on ${1}"
  fi
}    
test http://localhost:9096/pets/40
#test google.com






if [ "${HTTP_STATUS}" -== "HTTP/1.1 200 OK" ]; then
    echo "Test case 1 passed" ;
else
    echo "Test case 1 failed" ;
    exit 1;
fi


echo "alert 7" ;
HTTP_STATUS="$(curl -I -X GET http://localhost:9096/pets/40 | grep -c 'HTTP/1.1 200 OK' )";

if [ $HTTP_STATUS -eq 1 ]
then
MSG = " OKAY"
EXIT_CODE = 0
else
MSG = " NOT OKAY"
EXIT_CODE = 2
fi













#if [ -n "${TRAVIS_TAG}" ]; then
#docker pull tibdocker.tibco.com/mashling/mashling-sample:latest
#docker run -it -p 9096:9096 tibdocker.tibco.com/mashling/mashling-sample:latest
#fi

#if [ -z "${TRAVIS_TAG}" ]; then
#docker pull tibdocker.tibco.com/mashling/mashling-sample:master
#docker run -it -p 9096:9096 tibdocker.tibco.com/mashling/mashling-sample:master
#fi

#curl -I -X GET http://localhost:9096/pets/2
#curl -I -X PUT -d '{"name":"CAT"}' http://localhost:9096/pets
#curl -I -X PUT -d '{"name":"CATs"}' http://localhost:9096/pets