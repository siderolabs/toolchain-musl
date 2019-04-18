mkdir -p images

docker pull k8s.gcr.io/hyperkube:v${hyperkube}
docker save k8s.gcr.io/hyperkube:v${hyperkube} -o images/hyperkube.tar

docker pull k8s.gcr.io/etcd:${etcd}
docker save k8s.gcr.io/etcd:${etcd} -o images/etcd.tar

docker pull k8s.gcr.io/coredns:${coredns}
docker save k8s.gcr.io/coredns:${coredns} -o images/coredns.tar

docker pull k8s.gcr.io/pause:${pause}
docker save k8s.gcr.io/pause:${pause} -o images/pause.tar
