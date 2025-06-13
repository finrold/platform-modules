# ☸️ Módulo EKS

Este módulo cria um cluster Amazon EKS com suporte flexível a:

- Node Group (EC2) ✅
- Fargate (Serverless) ✅
- Ou ambos ao mesmo tempo 🔁

---

## 📦 Recursos criados

- Cluster EKS (`aws_eks_cluster`)
- Condicionalmente:
  - Node Group EC2 (`aws_eks_node_group`)
  - Fargate Profile (`aws_eks_fargate_profile`)

---

## 🔧 Variáveis principais

| Variável                         | Tipo          | Default         | Descrição |
|----------------------------------|---------------|------------------|-----------|
| `cluster_name`                   | `string`      | _obrigatório_    | Nome do cluster |
| `subnet_ids`                     | `list(string)`| _obrigatório_    | Subnets para o cluster |
| `cluster_role_arn`              | `string`      | _obrigatório_    | Role IAM do cluster |
| `node_role_arn`                 | `string`      | `null`           | Role IAM dos nodes EC2 (usada se `enable_node_group = true`) |
| `fargate_pod_execution_role_arn`| `string`      | `null`           | Role IAM para pods Fargate (usada se `enable_fargate = true`) |
| `enable_node_group`             | `bool`        | `true`           | Ativa Node Group EC2 |
| `enable_fargate`                | `bool`        | `false`          | Ativa Fargate |
| `instance_types`                | `list(string)`| `["t3.medium"]`  | Tipos de instância EC2 (usado somente com Node Group) |

> **ℹ️ Atenção**: `instance_types` é ignorado quando `enable_node_group = false`.

---

## 🧪 Exemplos de uso

### ✅ Node Group (EC2)

```hcl
module "eks" {
  source              = "github.com/finrold/platform-modules//eks?ref=main"
  cluster_name        = "eks-dev"
  subnet_ids          = module.vpc.public_subnet_ids
  cluster_role_arn    = aws_iam_role.eks_cluster_role.arn
  node_role_arn       = aws_iam_role.eks_node_role.arn
  enable_node_group   = true
  enable_fargate      = false
  instance_types      = ["t3.large"]
}
