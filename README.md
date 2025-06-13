# 🧱 platform-modules

Este repositório contém **módulos Terraform reutilizáveis** utilizados no projeto de Platform Engineering na AWS.

Cada módulo foi construído para ser reutilizado de forma padronizada e segura, promovendo boas práticas de Infraestrutura como Código (IaC), compondo a fundação de uma Internal Developer Platform (IDP).

---

## 📦 Módulos disponíveis

| Módulo | Descrição |
|--------|-----------|
| `vpc`  | Criação de VPC com subnets públicas, suporte a múltiplas zonas de disponibilidade. |
| `eks`  | Provisionamento de um cluster Amazon EKS com Node Group e configuração de rede. |

---

## 🛠️ Como utilizar

Exemplo de uso do módulo `vpc e eks`:

```hcl
module "vpc" {
  source = "github.com/finrold/platform-modules//vpc?ref=main"

  name                = "plataforma"
  cidr_block          = "10.0.0.0/16"
  public_subnet_cidrs = ["10.0.1.0/24", "10.0.2.0/24"]
}




module "eks" {
  source = "github.com/finrold/platform-modules//eks?ref=main"

  cluster_name      = "plataforma-eks"
  subnet_ids        = module.vpc.public_subnet_ids
  cluster_role_arn  = aws_iam_role.eks_cluster.arn
  node_role_arn     = aws_iam_role.eks_nodes.arn
}
