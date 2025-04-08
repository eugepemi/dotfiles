function kubeconfig() {
    KUBEHOME=~/.kube

    setopt +o nomatch
    for filename in ${KUBEHOME}/configs/**; do
        if [[ -z "${KUBECONFIG}" ]]; then
            export KUBECONFIG=${filename}
        else
            export KUBECONFIG=${filename}:${KUBECONFIG}
        fi
    done
    # NOTE: Automatically generated config for docker kubernetes
    KUBECONFIG=${KUBECONFIG}:${KUBEHOME}/config
    source <(helm completion zsh)
    source <(kubectl completion zsh)
}

function kubedown() {
    unset KUBECONFIG
    unset KUBEHOME
}