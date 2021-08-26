echo "I will start the docker app now"

docker build --no-cache -t next-app:latest .


#Run the Docker container using the command shown below.


docker run --name next -d -p 3000:3000 next-app


echo The application will be accessible at http://127.0.0.1:3000
