#!/bin/bash
set -e

# Run database migrations
dotnet WebAsp1.dll --migrate

# Start the application
exec dotnet WebAsp1.dll