# Build stage
FROM maven:3.9.7-amazoncorretto-21 AS build
# Create workdir build in container
WORKDIR /build
# Copy file pom.xml from host machine to workdir build
COPY pom.xml .
RUN mvn dependency:go-offline
# Copy folder src from host machine to workdir build
COPY src ./src
RUN mvn clean package -DskipTests

# Runtime stage
FROM amazoncorretto:21

# Define few things
WORKDIR /app
COPY --from=build /build/target/*.jar /app/demo.jar

EXPOSE 8123

ENTRYPOINT [ "java", "-jar", "/app/demo.jar" ]

# workdir build
#    pom.xml
#    src

# Note
#    . concurrent folder (build)
#    ./src folder children src, parent is concurrent folder
#    COPY --from=<stage_name> <source_path> <destination_path>
#    source_path: folder of stage_name, destination_path: folder of stage concurrent

# Build: docker build -t IMAGE_NAME:TAG -f [thư mục tới Dockerfile] .