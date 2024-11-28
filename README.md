# dotNetLinux
Mount project dotNet Core in Linux

## Docker commands
```bash
# Build and run
docker build -t webasp1 .
docker run -d -p 8080:8080 -e  DbConnectionString=""  --name webasp1_container webasp1

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

## SQL Server Connection String
```bash
Server=<endpoint>,<port>;Database=<database_name>;User Id=<username>;Password=<password>;TrustServerCertificate=True;
```

## eksctl commands
```bash
k get pods -A
k run nginx --image=nginx
k expose pod nginx --port=80 --name=nginx-service
k get svc nginx-service
curl <cluster-ip>:80

# troubleshooting
k logs nginx
k run test-pod --image=busybox --restart=Never --rm -it -- /bin/sh
wget -qO- http://10.100.84.1:80
wget -qO- http://nginx-service
wget -qO- http://dotnet-service

# using deployment and LoadBalancer to expose external
k create deployment nginx --image=nginx
k expose deployment nginx --port=80 --type=LoadBalancer --name=nginx-service
kubectl expose deployment dotnetapp --port=80 --target-port=8080 --type=LoadBalancer --name=dotnet-service
kubectl get endpoints nginx-service # for internal ip
curl a814b58d3331e49e6aca42a7648d6e0e-2052002553.us-east-1.elb.amazonaws.com # for external ip

# using port-forward
k create deployment nginx --image=nginx
k port-forward deployment/nginx 8080:80
```


## Onboard ArgoCD
```bash
k create namespace argocd
k apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Get the password
k -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d # for the password, remove the last character %

# Access the UI, user: admin, password
k port-forward svc/argocd-server -n argocd 8080:443
k delete pod dotnetapp --force --grace-period=0

```

### Other AWS commands
```bash
# Get the OIDC issuer URL
aws eks describe-cluster --name cloudnativesv --query "cluster.identity.oidc.issuer"
```

### Other kubectl commands
```bash
# exec container
k exec -it <pod-name> -- /bin/sh

```

## Build container app
