# Etapa 1: build del JAR con Maven
FROM maven:3.9.6-eclipse-temurin-17 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
# Compila y empaqueta sin tests
RUN mvn -B -DskipTests clean package

# Etapa 2: runtime ligero
FROM eclipse-temurin:17-jre
WORKDIR /app
# Copia el JAR generado (cualquier *-SNAPSHOT.jar)
COPY --from=build /app/target/*-SNAPSHOT.jar app.jar

# Railway inyecta PORT; tu app ya usa server.port=${PORT:<puerto-local>}
ENV JAVA_OPTS=""

# (Opcional) Exponer puerto para referencia local; en Railway no es obligatorio
# EXPOSE 8080

ENTRYPOINT ["sh", "-c", "java $JAVA_OPTS -jar app.jar"]
