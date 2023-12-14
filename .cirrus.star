load("github.com/cirrus-modules/helpers", "task", "container", "script")

"""
Build
    Build
    Provision
Configure
    DataDog setup
    kubectl ns create <NS>
    K8s secret apply
Install
    build.sh
    helm upgrade -n <NS>
"""
def main(ctx):
    return [
        task(
            name="[Build] Build",
            instance=container("debian:latest"),
            instructions=[script("echo 'terraform apply'")]
        ),
        task(
            name="[Build] Provision",
            instance=container("debian:latest"),
            instructions=[script("echo 'ansible-playbook'")]
        ),
        task(
            name="[Configure] DataDog setup",
            instance=container("debian:latest"),
            instructions=[script("echo 'k apply -f datadog.yaml'")]
        ),
        task(
            name="[Configure] kubectl ns create <NS>",
            instance=container("debian:latest"),
            instructions=[script("echo 'kubectl ns create <NS>'")]
        ),
        task(
            name="[Configure] K8s secret apply",
            instance=container("debian:latest"),
            instructions=[script("echo 'kubectl apply -f secret.yaml'")]
        ),
        task(
            name="[Install] build.sh",
            instance=container("debian:latest"),
            instructions=[script("echo 'build.sh'")]
        ),
        task(
            name="[Install] helm upgrade -n <NS>",
            instance=container("debian:latest"),
            instructions=[script("echo 'helm upgrade -n <NS>'")]
        ),
    ]
