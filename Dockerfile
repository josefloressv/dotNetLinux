# Use the official .NET image as a build environment
FROM mcr.microsoft.com/dotnet/sdk:9.0 AS build-env
WORKDIR /app

# Copy csproj and restore as distinct layers
COPY WebAsp1/WebAsp1.csproj ./
RUN dotnet restore

# Copy everything else and build
COPY WebAsp1/. ./
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:9.0
WORKDIR /app
COPY --from=build-env /app/out .

# Copy db.sqlite to the container
COPY WebAsp1/db.sqlite .

# Copy the entrypoint script
COPY entrypoint.sh .

# Expose port 8080
EXPOSE 8080

# Set the entry point for the container
ENTRYPOINT ["./entrypoint.sh"]
# ENTRYPOINT ["dotnet", "WebAsp1.dll"]