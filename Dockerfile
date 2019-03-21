#########################
### Build Environment ###
#########################

FROM gcc:4.9 as builder
WORKDIR /src
RUN mkdir -p /src/obj

#Copy Source code into the image
COPY ./src/* /src/

RUN make hellomake

# Compile application
CMD /src/hellomake

##################
### Production ###
##################

# Base Image
FROM alpine:edge

# Copy artifact build from the 'build environment'
COPY --from=builder /src/hellomake /src/hellomake

# Run application
CMD ["/src/hellomake"]