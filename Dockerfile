FROM centos:centos7
COPY nginx.repo /etc/yum.repos.d/nginx.repo
COPY nginx-self* /tmp/
COPY dhparam.pem /tmp/
COPY client.pem /tmp/
COPY self-signed.conf /etc/nginx/snippets/self-signed.conf
COPY ssl-params.conf /etc/nginx/snippets/ssl-params.conf
RUN  yum -y install nginx
EXPOSE 8002
EXPOSE 443
COPY default.conf /etc/nginx/conf.d/default.conf
ENTRYPOINT ["nginx","-g","daemon off;"]
