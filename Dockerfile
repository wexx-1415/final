FROM nginx:latest
COPY nginx.conf etc/nginx/nginx.conf
EXPOSE 81
CMD [ "nginx", "-g", "daemon off;" ]