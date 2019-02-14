FROM gcc:4.9
WORKDIR /HelloWorld/src
RUN mkdir -p /HelloWorld/src/obj

#Copy Source code into the image
COPY ./src/* /HelloWorld/src/

#Compile at 'Docker Build'
RUN make hellomake

#Run Application at docker run
CMD ["./hellomake"]