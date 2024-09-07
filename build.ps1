# Define the tag for Docker images
$tag = "3.5.1-hadoop3"

# Function to build Docker images
function Build-DockerImage {
    param (
        [string]$name,
        [string]$directory = ""
    )
    
    $image = "spark-${name}:$tag"
    $path = if ($directory -eq "") { ".\$name" } else { $directory }
    
    Write-Output "-------------------------- Building $image in $(Get-Location)"
    Set-Location $path
    try {
        docker build -t $image .
    } catch {
        Write-Error "Failed to build $image. Please check Docker setup."
        exit 1
    }
    Set-Location ..
}

# Check if arguments are passed
if ($args.Count -eq 0) {
    # Build all Docker images
    Build-DockerImage "base"
    Build-DockerImage "master"
    Build-DockerImage "worker"
    Build-DockerImage "history-server"
    Build-DockerImage "submit"
    # Uncomment the following lines if you need these images
    # Build-DockerImage "maven-template" "template/maven"
    # Build-DockerImage "sbt-template" "template/sbt"
    # Build-DockerImage "python-template" "template/python"
    # Build-DockerImage "python-example" "examples/python"
} else {
    # Build a specific Docker image based on arguments
    Build-DockerImage $args[0] $args[1]
}
