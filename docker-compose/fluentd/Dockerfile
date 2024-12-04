FROM fluent/fluentd:edge-debian
# RUN pip install plugin
MAINTAINER NCSOFT nc@ncsoft.com

USER root
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/\$TZ /etc/localtime && echo \$TZ > /etc/timezone
RUN mkdir -p /app/fluentd
#RUN chmod -R 700 /app
#RUN sudo chmod -R fluent.fluent /app
# Copy the Fluentd configuration file.
#COPY ./td-agent.conf /etc/fluent/fluent.conf

# Run the Fluentd service.
ENTRYPOINT ["fluentd"]