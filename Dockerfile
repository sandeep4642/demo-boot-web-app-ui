FROM openjdk

RUN groupadd -g 1999 sandeep-grp && useradd -r -u 1999 -g root sandeep

RUN mkdir /apps

WORKDIR /apps

COPY ./target/*.jar /apps/demo-boot-web-app-ui.jar

RUN chown sandeep:sandeep-grp /apps -R

EXPOSE 8080

USER sandeep:sandeep-grp

CMD ["java", "-jar", "/apps/demo-boot-web-app-ui.jar"]
