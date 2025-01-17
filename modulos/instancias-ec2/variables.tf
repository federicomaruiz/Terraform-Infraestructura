// Instancias-ec2 aqui vamos a necesitar los datos de entradas
//  Este modulo dado unos datos de entrada como el puerto , tipo_instancia , ami_id , una lista o conjunto de servidores, va a crear una flota de servidores

variable "puerto_servidor" {
  description = "Puerto para las instancias EC2"
  type        = number
  default     = 8080

  validation {
    condition     = var.puerto_servidor > 0 && var.puerto_servidor <= 65536
    error_message = "El valor del puerto debe estar comprendido entre 1 y 65536."
  }
}

variable "tipo_instancia" {
  description = "Tipo de la instancia EC2"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "AMI para los servidores"
  type        = string
}

variable "servidores" {
  description = "Mapa de servidores con su correspondiente subnet publica"

  type = map(object({
    nombre    = string,
    subnet_id = string
    })
  )
}

variable "entorno" {
    description = "Entorno en el que estamos trabajando"
    type = string
    default = ""
}
  
