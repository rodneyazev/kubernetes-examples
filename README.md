CLUSTER_IP = ONLY INTERNAL ACCESS
NODE_PORT = LIKE CLUSTER_IP, HOWEVER THE PODS ARE ACCESSIBLE EXTERNALLY.
LOAD_BALANCER = IT IS A CLUSTER_IP THAT PERMIT EXTERNAL ACCESS, BUT IT AUTOMATICALLY INTEGRATES TO CLOUD PROVIDER LOAD BALANCER

Replicaset = creates replicas (replicas: 2)
Deployments help with versioning and create a ReplicaSet automatically.




├── nginx
│   ├── clusterip-example
│   │   ├── nginx-1.yml
│   │   ├── nginx-2-svc.yml
│   │   └── nginx-2.yml
│   ├── deployment-example
│   │   └── nginx-deployment.yml
│   ├── loadbalancer-example
│   │   ├── nginx-1-svc.yml
│   │   ├── nginx-1.yml
│   │   ├── nginx-2-svc.yml
│   │   └── nginx-2.yml
│   ├── nodeport-example
│   │   ├── nginx-1-svc.yml
│   │   ├── nginx-1.yml
│   │   ├── nginx-2-svc.yml
│   │   └── nginx-2.yml
│   └── volume-example
│       ├── volume-local-example
│       │   └── nginx-local-volume-example.yml
│       ├── volume-pv-pvc-example
│       │   ├── nginx-pod.yml
│       │   ├── nginx-pv.yml
│       │   └── nginx-pvc.yml
│       └── volume-storageclass-example
│           ├── nginx-pod.yml
│           ├── nginx-pv.yml
│           ├── nginx-pvc.yml
│           └── nginx-storageclass.yml
└── portal-noticias
    ├── default-projext-example
    │   ├── 1-portal-noticias-configmap.yml
    │   ├── 1-portal-noticias-svc.yml
    │   ├── 1-portal-noticias.yml
    │   ├── 2-sistema-noticias-configmap.yml
    │   ├── 2-sistema-noticias-svc.yml
    │   ├── 2-sistema-noticias.yml
    │   ├── 3-db-noticias-configmap.yml
    │   ├── 3-db-noticias-svc.yml
    │   └── 3-db-noticias.yml
    ├── deployment-example
    │   ├── 1-portal-noticias-configmap.yml
    │   ├── 1-portal-noticias-deployment.yml
    │   ├── 1-portal-noticias-svc.yml
    │   ├── 2-sistema-noticias-configmap.yml
    │   ├── 2-sistema-noticias-deployment.yml
    │   ├── 2-sistema-noticias-svc.yml
    │   ├── 2-sistema-noticias.yml
    │   ├── 3-db-noticias-configmap.yml
    │   ├── 3-db-noticias-deployment.yml
    │   ├── 3-db-noticias-svc.yml
    │   └── backup
    │       ├── 1-portal-noticias-replicaset.yml
    │       └── 1-portal-noticias.yml
    ├── replicaset-example
    │   ├── 1-portal-noticias-configmap.yml
    │   ├── 1-portal-noticias-replicaset.yml
    │   ├── 1-portal-noticias-svc.yml
    │   ├── 2-sistema-noticias-configmap.yml
    │   ├── 2-sistema-noticias-svc.yml
    │   ├── 2-sistema-noticias.yml
    │   ├── 3-db-noticias-configmap.yml
    │   ├── 3-db-noticias-svc.yml
    │   └── 3-db-noticias.yml
    └── storageclass-and-statefulset-example
        ├── statefulset-example
        │   ├── 1-portal-noticias-configmap.yml
        │   ├── 1-portal-noticias-deployment.yml
        │   ├── 1-portal-noticias-svc.yml
        │   ├── 2-sistema-noticias-configmap.yml
        │   ├── 2-sistema-noticias-statefulset.yml
        │   ├── 2-sistema-noticias-svc.yml
        │   ├── 3-db-noticias-configmap.yml
        │   ├── 3-db-noticias-deployment.yml
        │   ├── 3-db-noticias-svc.yml
        │   ├── imagens-pvc.yml
        │   └── sessao-pvc.yml
        └── storageclass-example
            ├── 1-portal-noticias-configmap.yml
            ├── 1-portal-noticias-deployment.yml
            ├── 1-portal-noticias-svc.yml
            ├── 2-sistema-noticias-configmap.yml
            ├── 2-sistema-noticias-statefulset.yml
            ├── 2-sistema-noticias-svc.yml
            ├── 3-db-noticias-configmap.yml
            ├── 3-db-noticias-deployment.yml
            ├── 3-db-noticias-svc.yml
            └── storageclass.yml
