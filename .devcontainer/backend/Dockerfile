FROM eclipse-temurin:24-jdk

# Install PostgreSQL
RUN apt-get update && \
    apt-get install -y postgresql postgresql-contrib curl unzip git && \
    apt-get clean

# Set env vars (for convenience)
ENV POSTGRES_DB=apninotes
ENV POSTGRES_USER=postgres
ENV POSTGRES_PASSWORD=postgres
