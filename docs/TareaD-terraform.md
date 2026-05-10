## Paso 1. Creación de carpeta de trabajo

Se creó una carpeta independiente llamada `terraform-actividad2` para desarrollar la Tarea D.

Esta carpeta contendrá el archivo Terraform encargado de definir la instancia RDS MySQL solicitada en la actividad.

### Comandos utilizados

```bash
mkdir terraform-actividad2
cd terraform-actividad2

## Paso 2. Instalación y verificación de Terraform

Se instaló Terraform CLI en el equipo local para poder definir y crear infraestructura en AWS mediante código.

Posteriormente, se verificó la instalación ejecutando el comando `terraform version`.

### Comandos utilizados

```powershell
winget install Hashicorp.Terraform
terraform version

## Paso 3. Creación del archivo main.tf

Se creó el archivo `main.tf`, donde se definirá la infraestructura como código correspondiente a la Tarea D.

Este archivo contendrá la configuración del proveedor AWS y la instancia RDS MySQL solicitada.

### Comandos utilizados

```powershell
New-Item main.tf
code .

## Paso 4. Definición de la instancia RDS en Terraform

Se definió una instancia RDS MySQL mediante Terraform en el archivo `main.tf`.

La configuración cumple con los requisitos de la Tarea D: identificador `actividad2-terra`, base de datos `DB_terra`, usuario `admTerra`, tipo de instancia `db.t3.micro`, almacenamiento de 15 GB, periodo de retención de backups de 15 días, ventana de backup a las 03:00 UTC, ventana de mantenimiento a las 05:00 UTC y cifrado activo.

### Código principal utilizado

```hcl
resource "aws_db_instance" "rds_terra" {
  identifier = "actividad2-terra"

  engine         = "mysql"
  engine_version = "5.7"
  instance_class = "db.t3.micro"

  allocated_storage = 15
  storage_type      = "gp2"
  storage_encrypted = true

  db_name  = "DB_terra"
  username = "admTerra"
  password = "Viu2022Terra"

  backup_retention_period = 15
  backup_window           = "03:00-04:00"
  maintenance_window      = "sun:05:00-sun:06:00"

  skip_final_snapshot = true
  publicly_accessible = false
}

## Paso 5. Inicialización de Terraform

Se ejecutó el comando `terraform init` para inicializar el directorio de trabajo de Terraform.

Este comando descarga el proveedor de AWS necesario para poder crear recursos en Amazon Web Services.

### Comando utilizado

```powershell
terraform init

## Paso 6. Validación de la configuración Terraform

Se ejecutó el comando `terraform validate` para verificar que la configuración definida en el archivo `main.tf` fuera válida.

Terraform confirmó que la sintaxis y estructura del archivo son correctas y que la infraestructura puede ser procesada sin errores.

### Comando utilizado

```powershell
terraform validate

## Paso 7. Instalación de AWS CLI

Se instaló AWS CLI en el equipo local para permitir la autenticación y comunicación con los servicios de Amazon Web Services desde la terminal.

Posteriormente, se verificó la instalación utilizando el comando `aws --version`.

### Comandos utilizados

```powershell
winget install Amazon.AWSCLI
aws --version

## Paso 8. Configuración de credenciales AWS Academy

Se configuraron las credenciales temporales proporcionadas por AWS Academy mediante variables de entorno en PowerShell.

Estas credenciales permiten que Terraform pueda autenticarse contra AWS para crear la infraestructura solicitada en la actividad.

### Comandos utilizados

```powershell
$env:AWS_ACCESS_KEY_ID="***"
$env:AWS_SECRET_ACCESS_KEY="***"
$env:AWS_SESSION_TOKEN="***"
$env:AWS_DEFAULT_REGION="us-east-1"

aws sts get-caller-identity


## Paso 9. Revisión del plan de Terraform

Se ejecutó el comando `terraform plan` para revisar los cambios que Terraform aplicará en AWS.

Este comando permite comprobar previamente la infraestructura que será creada, sin modificar todavía los recursos reales en AWS.

El plan mostró la creación de una instancia RDS MySQL con la configuración solicitada para la Tarea D.

### Comando utilizado

```powershell
terraform plan

## Paso 10. Creación de la instancia RDS con Terraform

Se ejecutó el comando `terraform apply` para crear la infraestructura definida en el archivo `main.tf`.

Terraform solicitó confirmación antes de aplicar los cambios. Se confirmó escribiendo `yes`.

Después de varios minutos, Terraform completó correctamente la creación de la instancia RDS MySQL solicitada en la actividad.

### Comando utilizado

```powershell
terraform apply

## Paso 11. Verificación de la instancia RDS en AWS

Se verificó desde la consola web de AWS que la instancia RDS MySQL fue creada correctamente mediante Terraform.

La instancia aparece con el identificador `actividad2-terra` y en estado `Available`, confirmando que la infraestructura fue desplegada exitosamente.

### Evidencia

Se adjuntó una captura de pantalla de la consola de Amazon RDS mostrando la instancia en ejecución.

## Paso 12. Eliminación de recursos Terraform

Después de obtener las evidencias necesarias de la actividad, se eliminó la infraestructura creada para evitar consumo innecesario de créditos en AWS Academy.

Terraform eliminó automáticamente la instancia RDS creada previamente.

### Comando utilizado

```powershell
terraform destroy