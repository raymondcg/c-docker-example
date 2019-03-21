#########################
### Build Environment ###
#########################

# Base Image
FROM alpine:edge as builder

ARG BUILD_DATE
ARG VCS_REF

LABEL org.label-schema.build-date=$BUILD_DATE \
      org.label-schema.vcs-url="https://github.com/comodal/alpine-gcc-make.git" \
	  org.label-schema.vcs-ref=$VCS_REF \
	  org.label-schema.name="GCC & Make Alpine:edge Image" \
	  org.label-schema.usage="https://github.com/comodal/alpine-gcc-make#docker-run" \
	  org.label-schema.schema-version="1.0.0-rc.1"
	  
RUN set -x \
    && apk add --no-cache \
	gcc \
	make \ 
	musl-dev

WORKDIR /src
RUN ["mkdir","-p","/src/obj/"]

# Copy source code into the image
COPY ./src/* /src/

# Compile
CMD ["make","hellomake"]

##################
### Production ###
##################

# Base Image
FROM alpine:edge

# Copy artifact build from the 'build environment'
COPY --from=builder /src/hellomake /src/hellomake

RUN ls -lah /src

# Run application
CMD ["/src/hellomake"]