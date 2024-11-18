# dotNetLinux
Mount project dotNet Core in Linux

## Docker commands
```bash
# Build and run
docker build -t webasp1 .
docker run -d -p 80:80 --name webasp1_container webasp1

# Check files in container
docker exec -it <containerid> /bin/sh
ls /app

# Copy file to container
docker cp /path/to/your/db.sqlite <containerid>:/app/db.sqlite
```

## dotnet commands
```bash
# Check version
dotnet --version

# Check installed SDKs
dotnet --list-runtimes

# Restore the project dependencies
dotnet restore

# Build the project
dotnet build

# Run the project
dotnet run

# Install package
dotnet add package Microsoft.Extensions.Configuration
```